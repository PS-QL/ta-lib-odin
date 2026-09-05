package main

import "core:fmt"
import "core:c"
import ta "./talib" // Imports your local auto-generated wrapper module

// Enum tracking portfolio transaction execution states
PositionState :: enum {
    FLAT,
    LONG,
}

// ============================================================================
// MODULE 2: Zero-Allocation Circular Window Buffer
// ============================================================================
RollingWindow :: struct {
    data:     []f64,
    capacity: int,
    cursor:   int, // Current write head index pointer
    is_full:  bool,
}

// Allocates fixed memory boundaries once at initialization
init_window :: proc(w: ^RollingWindow, cap: int) {
    w.capacity = cap
    w.data = make([]f64, cap)
    w.cursor = 0
    w.is_full = false
}

free_window :: proc(w: ^RollingWindow) {
    delete(w.data)
}

// Pushes streaming realtime ticks into the ring buffer with zero ongoing allocations
push_tick :: proc(w: ^RollingWindow, val: f64) {
    w.data[w.cursor] = val
    w.cursor += 1
    
    if w.cursor >= w.capacity {
        w.cursor = 0 // Wrap around the memory boundary smoothly
        w.is_full = true
    }
}

// Re-aligns internal data linearly into a scratchpad slice for contiguous FFI processing
extract_linear :: proc(w: RollingWindow, dest: []f64) {
    if !w.is_full {
        copy(dest[0:w.cursor], w.data[0:w.cursor])
        return
    }
    
    // Split block copy operation to safely unwrap cursor wrap-around offsets
    copy(dest[0:w.capacity - w.cursor], w.data[w.cursor:w.capacity])
    copy(dest[w.capacity - w.cursor:w.capacity], w.data[0:w.cursor])
}

// ============================================================================
// MODULE 3: Comprehensive Multi-Factor Strategy Engine
// ============================================================================
main :: proc() {
    // 25-tick historical asset market data feed (Closing prices)
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
    // MODULE 1: Dynamic Lookback Synchronization
    // ============================================================================
    // Query lookback requirements dynamically from the wrapper to handle index offsets
    bb_lookback  := ta.TA_BBANDS_Lookback(BB_PERIOD, 1.0, 1.0, .SMA)
    rsi_lookback := ta.TA_RSI_Lookback(RSI_PERIOD)
    max_lookback := cast(int)max(bb_lookback, rsi_lookback)

    // Pre-allocate flat heap buffers for calculations
    upper_band  := make([]f64, n)
    middle_band := make([]f64, n)
    lower_band  := make([]f64, n)
    rsi_output  := make([]f64, n)
    defer delete(upper_band); defer delete(middle_band); defer delete(lower_band); defer delete(rsi_output)

    bb_beg, bb_count: i32
    rsi_beg, rsi_count: i32

    // Run calculations over the historical array using flat pointer references
    ta.TA_BBANDS(0, n - 1, raw_data(closes), BB_PERIOD, 1.0, 1.0, .SMA, &bb_beg, &bb_count, raw_data(upper_band), raw_data(middle_band), raw_data(lower_band))
    ta.TA_RSI(0, n - 1, raw_data(closes), RSI_PERIOD, &rsi_beg, &rsi_count, raw_data(rsi_output))

    // Portfolio Accounting Variables
    current_position := PositionState.FLAT
    account_balance  := 10000.0 // Initial cash capital
    entry_price      := 0.0
    trade_units      := 100.0   // Shared sizing allocation 
    COMMISSION       :: 2.00    // Flat transactional slippage fee per trade leg

    fmt.printf("====================================================================================\n")
    fmt.printf("                 ODIN QUANT ENGINE: MULTI-FACTOR STRATEGY & PNL                     \n")
    fmt.printf("====================================================================================\n")
    fmt.printf("Tick | Price  | BB Lower | RSI  | Signal     | Trade PnL | Fees   | Net Cash Balance\n")
    fmt.printf("------------------------------------------------------------------------------------\n")

    // Synchronize iteration loops directly to our maximum stabilization lookback threshold
    for i in max_lookback..<cast(int)n {
        // Compute alignment offsets because indicators start writing outputs at index 0
        bb_idx  := i - cast(int)bb_beg
        rsi_idx := i - cast(int)rsi_beg
        
        spot  := closes[i]
        lower := lower_band[bb_idx]
        mid   := middle_band[bb_idx]
        rsi   := rsi_output[rsi_idx]
        
        action := "HOLD"
        realized_pnl := 0.0
        applied_fees := 0.0

        // Multi-Factor Quantitative Strategy Logic Checks
        if current_position == .FLAT {
            // Entry Condition: Price violates lower band channel and RSI confirms oversold
            if spot < lower && rsi < 40.0 {
                action = "BUY_LONG"
                current_position = .LONG
                entry_price = spot
                applied_fees = COMMISSION
                account_balance -= applied_fees
            }
        } else if current_position == .LONG {
            // Exit Condition: Price reverts back up past moving average midline
            if spot > mid || rsi > 55.0 {
                action = "EXIT_LONG"
                current_position = .FLAT
                
                // Realized PnL Calculation: ((Exit Price - Entry Price) * Units) - Fees
                raw_pnl := (spot - entry_price) * trade_units
                applied_fees = COMMISSION
                realized_pnl = raw_pnl - applied_fees
                
                account_balance += realized_pnl
            }
        }

        // Strict Type Conversion: Force explicit int casting for variable additions inside strings
        fmt.printf("%04d | %6.2f | %8.2f | %4.1f | %-10s | %9.2f | %6.2f | $%12.2f\n", 
            i, spot, lower, rsi, action, realized_pnl, applied_fees, account_balance)
    }
    fmt.printf("====================================================================================\n")
}
