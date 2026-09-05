## Odin TA-Lib Wrapper 📈
A high-performance, zero-allocation Odin programming language wrapper for the [TA-Lib](http://ta-lib.org/) C/C++ technical analysis library.
This wrapper introduces bare-metal technical indicator pipelines directly into the Odin ecosystem using zero-cost Foreign Function Interface (FFI) bindings. By leveraging native multi-pointer slices ([^]f64) and flat, continuous memory layouts, this library allows quantitative developers to achieve optimal hardware prefetching and processing throughput without garbage collection latency.

* Includes 100+ native indicators such as ADX, MACD, RSI, Stochastic, and Bollinger Bands.
* High-performance processing accommodating both double precision (f64) and single precision (f32) input arrays.
* Comprehensive candlestick pattern recognition heuristics built directly into type definitions.
* Licensed under the permissive open-source BSD-2-Clause License—protecting author endorsement while granting complete commercial freedom.

------------------------------
## 💾 Installation & Dependency Setup
To link and build this wrapper inside your quantitative project, you must supply the 64-bit static TA-Lib C library asset mapped inside your toolchain environment.
## Windows Setup

   1. Download the official 64-bit target compilation asset package: ta-lib-0.7.1-windows-x86_64.zip.
   2. Extract the content files and locate the static library archive inside the /lib/ subfolder.
   3. Copy ta-lib.lib and save it directly inside your local wrapper package space (e.g., C:/YourProject/talib/).

------------------------------
## ⚙️ Automated Binding Generation Workflow
The bindings are constructed utilizing the [odin-c-bindgen](https://github.com/karl-zylinski/odin-c-bindgen) utility block parsing abstract syntax trees from raw C header arrays.
## 1. Configure the bindgen.sjson Script
Place this explicit configuration file in your translation scratchpad folder next to your target C header assets (ta_defs.h and ta_func.h). Note: Always use forward slashes (/) to prevent character escaping errors within the SJSON parser.

    {
   	output_filename: "ta_lib.odin",
   	foreign_library_name: "ta_lib",
   	extra_linker_flags_windows: "/LIBPATH:C:/Dev/scripts/odin/ta_lib/talib",
   	libraries_windows: [
   		"ta-lib.lib"
   	],
   	libraries_linux: [
   		"ta_lib"
   	],
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
Invoke your compiled bindgen.exe binary passing strictly the target directory to prevent an argument count crash:

    bindgen.exe C:\Dev\scripts\odin\ta-lib-gen

Your generated package files (ta_defs.odin and ta_func.odin) will appear inside the target output subfolder.
## 3. Post-Generation Cleanup (Important)

   1. Remove Duplicate Constants: Open the newly generated ta_defs.odin and remove the duplicate __64BIT__ :: 1 line to clear the redeclaration error.
   2. Unify FFI Token Names: Open ta_func.odin. Ensure the top contains your foreign import ta_lib "ta-lib.lib" wrapper block, and ensure your procedure block matches the token name string: foreign ta_lib {.

------------------------------

## 🏎️ Core Performance Architecture
Odin features zero implicit numeric conversion. Parameters, indices, and return evaluations must handle data signatures intentionally. This wrapper utilizes three vital performance design patterns:
## 1. Dynamic Lookback Synchronization
Indicators require an initial stabilization window before outputting meaningful data. Instead of hardcoding index ranges, query the companion *_Lookback procedures dynamically to synchronize your arrays perfectly and prevent out-of-bounds crashes.
## 2. Zero-Allocation Circular Window Buffer
To stream live pricing updates from a network socket without triggering heap allocations or garbage collection thrashing, deploy a bounding ring structure. This unwraps data linearly into contiguous memory arrays right before feeding the FFI layer.
## 3. Multi-Factor Strategy Matrix
Combine trend, volatility, and momentum indicators together inside a clean execution loop that maps strict type boundaries (cast(int)) and handles case-sensitive returns (.SUCCESS).

------------------------------

## 💻 Full Standalone Production Example
This continuous code file implements Dynamic Lookback Synchronization, includes the structural layout for the Zero-Allocation Circular Window Buffer, and executes a comprehensive Multi-Factor Strategy Loop tracking real-time trade signals and realized portfolio PnL curves:

      package main
      
      import "core:fmt"
      import "core:c"
      import ta "./talib" // Point this exactly to your local bindings package
      
      PositionState :: enum {
          FLAT,
          LONG,
      }
      
      // ============================================================================
      // FEATURE 2: Zero-Allocation Circular Window Buffer
      // ============================================================================
      RollingWindow :: struct {
          data:     []f64,
          capacity: int,
          cursor:   int, // Write head index pointer
          is_full:  bool,
      }
      
      init_window :: proc(w: ^RollingWindow, cap: int) {
          w.capacity = cap
          w.data = make([]f64, cap)
          w.cursor = 0
          w.is_full = false
      }
      
      free_window :: proc(w: ^RollingWindow) {
          delete(w.data)
      }
      
      push_tick :: proc(w: ^RollingWindow, val: f64) {
          w.data[w.cursor] = val
          w.cursor += 1
    
       if w.cursor >= w.capacity {
           w.cursor = 0 // Wrap around the memory ring safely
           w.is_full = true
       }
    }

    extract_linear :: proc(w: RollingWindow, dest: []f64) {
        if !w.is_full {
            copy(dest[0:w.cursor], w.data[0:w.cursor])
            return
     }
    
    // Re-align internal data contiguously into our destination cache
    copy(dest[0:w.capacity - w.cursor], w.data[w.cursor:w.capacity])
    copy(dest[w.capacity - w.cursor:w.capacity], w.data[0:w.cursor])
    }

    // ============================================================================
    // FEATURE 3: Comprehensive Multi-Factor Strategy Example
    // ============================================================================
    main :: proc() {
          // 25-tick historical asset market data feed
          closes := []f64{
              100.0, 102.5, 101.2, 104.0, 103.1, 
              105.0, 107.5, 105.0, 103.2, 100.1,  
              98.5,  99.0,  101.5, 102.8, 103.7, 
              104.5, 105.2, 106.8, 104.0, 101.8, 
              100.2,  98.1,  98.8, 100.5, 101.9,
          }
          n := i32(len(closes))
      
    BB_PERIOD  :: 5
    RSI_PERIOD :: 5
    
    // ============================================================================
    // FEATURE 1: Dynamic Lookback Synchronization
    // ============================================================================
    bb_lookback  := ta.TA_BBANDS_Lookback(BB_PERIOD, 1.0, 1.0, .SMA)
    rsi_lookback := ta.TA_RSI_Lookback(RSI_PERIOD)
    max_lookback := cast(int)max(bb_lookback, rsi_lookback)

    upper_band  := make([]f64, n)
    middle_band := make([]f64, n)
    lower_band  := make([]f64, n)
    rsi_output  := make([]f64, n)
    defer delete(upper_band); defer delete(middle_band); defer delete(lower_band); defer delete(rsi_output)

    bb_beg, bb_count: i32
    rsi_beg, rsi_count: i32

    ta.TA_BBANDS(0, n - 1, raw_data(closes), BB_PERIOD, 1.0, 1.0, .SMA, &bb_beg, &bb_count, raw_data(upper_band), raw_data(middle_band), raw_data(lower_band))
    ta.TA_RSI(0, n - 1, raw_data(closes), RSI_PERIOD, &rsi_beg, &rsi_count, raw_data(rsi_output))

    // Portfolio PnL Accounting State
    current_position := PositionState.FLAT
    account_balance  := 10000.0 // Starting cash allocation capital
    entry_price      := 0.0
    trade_units      := 100.0   // Fixed share size per position instance
    COMMISSION       :: 2.00    // Flat transactional cost fee per execution leg

    fmt.printf("====================================================================================\n")
    fmt.printf("                 QUANT ENGINE REPORT: MULTI-FACTOR STRATEGY & PNL                   \n")
    fmt.printf("====================================================================================\n")
    fmt.printf("Tick | Price  | BB Lower | RSI  | Signal     | Trade PnL | Fees   | Net Cash Balance\n")
    fmt.printf("------------------------------------------------------------------------------------\n")

    for i in max_lookback..<cast(int)n {
        bb_idx  := i - cast(int)bb_beg
        rsi_idx := i - cast(int)rsi_beg
        
        spot  := closes[i]
        lower := lower_band[bb_idx]
        mid   := middle_band[bb_idx]
        rsi   := rsi_output[rsi_idx]
        
        action := "HOLD"
        realized_pnl := 0.0
        applied_fees := 0.0

        if current_position == .FLAT {
            if spot < lower && rsi < 40.0 {
                action = "BUY_LONG"
                current_position = .LONG
                entry_price = spot
                applied_fees = COMMISSION
                account_balance -= applied_fees
            }
        } else if current_position == .LONG {
            if spot > mid || rsi > 55.0 {
                action = "EXIT_LONG"
                current_position = .FLAT
                
                raw_pnl := (spot - entry_price) * trade_units
                applied_fees = COMMISSION
                realized_pnl = raw_pnl - applied_fees
                
                account_balance += realized_pnl
            }
        }

        // Note the explicit 'cast(int)out_beg_idx' addition expression
        fmt.printf("%04d | %6.2f | %8.2f | %4.1f | %-10s | %9.2f | %6.2f | $%12.2f\n", 
            i, spot, lower, rsi, action, realized_pnl, applied_fees, account_balance)
      }
      fmt.printf("====================================================================================\n")
    }

------------------------------
## 🛠️ Performance Compilation Guide
To bypass array runtime safety bounds checks and completely unlock hardware-level vectorization tailored precisely to your local processor registers, compile your module using these performance optimization flags:

    odin build main.odin -file -o:speed -no-bounds-check -microarch:native

------------------------------
## 📜 License
This software project wrapper is distributed under the open-source BSD-2-Clause License. It grants full commercial, private, and modification distribution rights while explicitly safeguarding contributors from downstream marketing endorsement liabilities.
------------------------------

