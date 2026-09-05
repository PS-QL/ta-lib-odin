## Odin TA-Lib Wrapper 📈
A high-performance, zero-allocation Odin programming language wrapper for the [TA-Lib](http://ta-lib.org/) C/C++ technical analysis library.
This wrapper introduces bare-metal technical indicator pipelines directly into the Odin ecosystem using zero-cost Foreign Function Interface (FFI) bindings. By leveraging native multi-pointer slices ([^]f64) and Structure of Arrays (#soa) layouts, this library allows quantitative developers to achieve optimal hardware prefetching and processing throughput without garbage collection latency.

* Includes 100+ native indicators such as ADX, MACD, RSI, Stochastic, and Bollinger Bands.
* High-performance processing accommodating both double precision (f64) and single precision (f32) input arrays.
* Comprehensive candlestick pattern recognition heuristics built directly into type definitions.

------------------------------
## 💾 Installation & Workspace Architecture## 🧩 Dependencies & Requirements
To link and build this wrapper inside your quantitative project, you must have the 64-bit static TA-Lib C library asset and system header compilers mapped inside your toolchain environment.
## 1. Windows Pre-compiled Setup

   1. Download the official 64-bit target compilation asset package: ta-lib-0.7.1-windows-x86_64.zip.
   2. Extract the content files and locate the static library archive inside the /lib/ subfolder.
   3. Copy ta-lib.lib and save it directly inside your local wrapper package space (e.g., C:/YourProject/talib/).

------------------------------
## ⚙️ Automated Binding Generation Workflow
The bindings are constructed utilizing the [odin-c-bindgen](https://github.com/karl-zylinski/odin-c-bindgen) utility block parsing abstract syntax trees from raw C header arrays.
## 1. Configure the bindgen.sjson Script
Place this explicit configuration file in your translation scratchpad folder next to your target C header assets (ta_defs.h and ta_func.h):

    {
       output_filename: "ta_lib.odin",
       foreign_library_name: "ta_lib",
       extra_linker_flags_windows: "/LIBPATH:C:/Dev/scripts/odin/ta_lib/talib",
       libraries_windows: ["ta-lib.lib"],
       libraries_linux: ["ta_lib"],
       package_name: "talib",
       prefix_to_strip: "TA_",
       character_type: "u8",
       
       // Process ta_defs first so type tokens map before signatures
       inputs: [
           "ta_defs.h",
           "ta_func.h"
       ],
   
       compile_arguments: [
           "-IC:/rtools45/mingw64/include",
           "-IC:/rtools45/mingw64/lib/gcc/x86_64-w64-mingw32/14.1.0/include",
           "-IC:/Dev/scripts/odin/ta-lib-gen"
          ]
    }

## 2. Execute Generator
Invoke your compiled bindgen.exe binary passing strictly the target directory to output your code files:

      bindgen.exe C:\Dev\scripts\odin\ta-lib-gen

------------------------------
## 📈 Core API & Quantitative Design Patterns
Odin features zero implicit numeric conversion. Parameters, indices, and return evaluations must handle data signatures intentionally.
## 📐 1. Dynamic Lookback Synchronization
Every indicator includes a lookback evaluation signature (e.g., TA_RSI_Lookback). Use this component to dynamically slice uninitialized dead memory zones out of execution pipelines:

      import "core:fmt"
      import "core:c"
      import ta "./talib"
      
      // Slices track data contiguously via the address-of raw data operator
      lookback := ta.TA_RSI_Lookback(14) 
      out_beg_idx, out_nb_element: i32
      
      ret := ta.TA_RSI(0, i32(len(prices)-1), raw_data(prices), 14, &out_beg_idx, &out_nb_element, raw_data(rsi_out))
      
      if ret == .SUCCESS {
          // Zero-allocation slice window tracking valid metrics safely
          valid_signals := rsi_out[0:out_nb_element]
      }

## 🏎️ 2. Zero-Allocation Circular Window Buffer
To stream live pricing feeds without triggering runtime heap reallocations or thrashing garbage collectors, deploy a tracking structure like this circular queue block:

      RollingWindow :: struct {
          data:     []f64,
          capacity: int,
          cursor:   int,
          is_full:  bool,
      }
      
      push_tick :: proc(w: ^RollingWindow, val: f64) {
          w.data[w.cursor] = val
          w.cursor += 1
          if w.cursor >= w.capacity {
              w.cursor = 0 // Wrap around the memory ring smoothly
              w.is_full = true
          }
      }
      
      extract_linear :: proc(w: RollingWindow, dest: []f64) {
          if !w.is_full {
              copy(dest[0:w.cursor], w.data[0:w.cursor])
              return
          }
          copy(dest[0 : w.capacity - w.cursor], w.data[w.cursor : w.capacity])
          copy(dest[w.capacity - w.cursor : w.capacity], w.data[0 : w.cursor])
      }
      
------------------------------
## 📊 3. Comprehensive Multi-Factor Strategy Example
The module merges overlapping mathematical indicators seamlessly into an isolated strategic matrix loop:

    
    package main
    import "core:fmt"
    import "core:c"
    import ta "./talib"

    PositionState :: enum { FLAT, LONG }
      
    main :: proc() {
    closes := []f64{100.0, 102.5, 101.2, 104.0, 103.1, 105.0, 107.5, 105.0, 103.2, 100.1, 98.5, 99.0, 101.5, 102.8, 103.7}
    n := i32(len(closes))
    BB_PERIOD, rsi_beg, bb_beg, rsi_count, bb_count: i32 = 5, 0, 0, 0, 0
    upper, mid, lower := make([]f64, n), make([]f64, n), make([]f64, n)
    rsi_output := make([]f64, n)
    defer delete(upper); defer delete(mid); defer delete(lower); defer delete(rsi_output)

    ta.TA_BBANDS(0, n - 1, raw_data(closes), BB_PERIOD, 1.0, 1.0, .SMA, &bb_beg, &bb_count, raw_data(upper), raw_data(mid), raw_data(lower))
    ta.TA_RSI(0, n - 1, raw_data(closes), 5, &rsi_beg, &rsi_count, raw_data(rsi_output))

    current_position := PositionState.FLAT
    account_balance, entry_price, trade_units := 10000.0, 0.0, 100.0

    for i in 4..<cast(int)n {
        spot, b_low, b_mid, rsi := closes[i], lower[i - cast(int)bb_beg], mid[i - cast(int)bb_beg], rsi_output[i - cast(int)rsi_beg]
        
        if current_position == .FLAT && spot < b_low && rsi < 40.0 {
            current_position, entry_price = .LONG, spot
            account_balance -= 2.00 // Deduct entry commission leg fee
            fmt.printf("[EXECUTION] BUY LONG at %.2f\n", spot)
        } else if current_position == .LONG && spot > b_mid {
            current_position = .FLAT
            realized_pnl := ((spot - entry_price) * trade_units) - 2.00
            account_balance += realized_pnl
            fmt.printf("[EXECUTION] EXIT LONG at %.2f | Trade PnL: $%.2f | Balance: $%.2f\n", spot, realized_pnl, account_balance)
        }
      }
    }

------------------------------
## 🛠️ Performance Compilation Guide
To bypass runtime boundaries and maximize instruction pipelining, build your binary using these compiler flags:

odin build project_file.odin -file -o:speed -no-bounds-check -microarch:native

------------------------------
## 📜 License
This software project wrapper is distributed under the open-source BSD-2-Clause License.
------------------------------

