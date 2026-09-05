/* TA-LIB Copyright (c) 1999-2025, Mario Fortier
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or
 * without modification, are permitted provided that the following
 * conditions are met:
 *
 * - Redistributions of source code must retain the above copyright
 *   notice, this list of conditions and the following disclaimer.
 *
 * - Redistributions in binary form must reproduce the above copyright
 *   notice, this list of conditions and the following disclaimer in
 *   the documentation and/or other materials provided with the
 *   distribution.
 *
 * - Neither name of author nor the names of its contributors
 *   may be used to endorse or promote products derived from this
 *   software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * REGENTS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 * OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
package talib

import "core:c"

// 1. THIS IS THE CRITICAL MISSING BLOCK: 
// It tells Odin that 'ta_lib' is a valid foreign token linked to your static file.
when ODIN_OS == .Windows {
    @(extra_linker_flags="/LIBPATH:C:\\Dev\\scripts\\odin\\ta_lib\\talib")
    foreign import ta_lib "ta-lib.lib"
} else {
    foreign import ta_lib "system:ta_lib"
}



@(default_calling_convention="c")
foreign ta_lib {
	/*
	* TA_ACCBANDS - Acceleration Bands
	*
	* Input  = High, Low, Close
	* Output = double, double, double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 2 to 100000)
	*    Number of period
	*
	*
	*/
	TA_ACCBANDS          :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outRealUpperBand: [^]f64, outRealMiddleBand: [^]f64, outRealLowerBand: [^]f64) -> TA_RetCode ---
	TA_S_ACCBANDS        :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outRealUpperBand: [^]f64, outRealMiddleBand: [^]f64, outRealLowerBand: [^]f64) -> TA_RetCode ---
	TA_ACCBANDS_Lookback :: proc(optInTimePeriod: i32 /* From 2 to 100000 */) -> i32 --- /* From 2 to 100000 */

	/*
	* TA_ACOS - Vector Trigonometric ACos
	*
	* Input  = double
	* Output = double
	*
	*/
	TA_ACOS          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_ACOS        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_ACOS_Lookback :: proc() -> i32 ---

	/*
	* TA_AD - Chaikin A/D Line
	*
	* Input  = High, Low, Close, Volume
	* Output = double
	*
	*/
	TA_AD          :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, inVolume: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_AD        :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, inVolume: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_AD_Lookback :: proc() -> i32 ---

	/*
	* TA_ADD - Vector Arithmetic Add
	*
	* Input  = double, double
	* Output = double
	*
	*/
	TA_ADD          :: proc(startIdx: i32, endIdx: i32, inReal0: [^]f64, inReal1: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_ADD        :: proc(startIdx: i32, endIdx: i32, inReal0: [^]f32, inReal1: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_ADD_Lookback :: proc() -> i32 ---

	/*
	* TA_ADOSC - Chaikin A/D Oscillator
	*
	* Input  = High, Low, Close, Volume
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInFastPeriod:(From 2 to 100000)
	*    Number of period for the fast MA
	*
	* optInSlowPeriod:(From 2 to 100000)
	*    Number of period for the slow MA
	*
	*
	*/
	TA_ADOSC          :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, inVolume: [^]f64, optInFastPeriod: i32, optInSlowPeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_ADOSC        :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, inVolume: [^]f32, optInFastPeriod: i32, optInSlowPeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_ADOSC_Lookback :: proc(optInFastPeriod: i32, optInSlowPeriod: i32 /* From 2 to 100000 */) -> i32 --- /* From 2 to 100000 */

	/*
	* TA_ADX - Average Directional Movement Index
	*
	* Input  = High, Low, Close
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 2 to 100000)
	*    Number of period
	*
	*
	*/
	TA_ADX          :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_ADX        :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_ADX_Lookback :: proc(optInTimePeriod: i32 /* From 2 to 100000 */) -> i32 --- /* From 2 to 100000 */

	/*
	* TA_ADXR - Average Directional Movement Index Rating
	*
	* Input  = High, Low, Close
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 2 to 100000)
	*    Number of period
	*
	*
	*/
	TA_ADXR          :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_ADXR        :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_ADXR_Lookback :: proc(optInTimePeriod: i32 /* From 2 to 100000 */) -> i32 --- /* From 2 to 100000 */

	/*
	* TA_APO - Absolute Price Oscillator
	*
	* Input  = double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInFastPeriod:(From 2 to 100000)
	*    Number of period for the fast MA
	*
	* optInSlowPeriod:(From 2 to 100000)
	*    Number of period for the slow MA
	*
	* optInMAType:
	*    Type of Moving Average
	*
	*
	*/
	TA_APO          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInFastPeriod: i32, optInSlowPeriod: i32, optInMAType: TA_MAType, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_APO        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInFastPeriod: i32, optInSlowPeriod: i32, optInMAType: TA_MAType, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_APO_Lookback :: proc(optInFastPeriod: i32, optInSlowPeriod: i32, optInMAType: TA_MAType) -> i32 ---

	/*
	* TA_AROON - Aroon
	*
	* Input  = High, Low
	* Output = double, double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 2 to 100000)
	*    Number of period
	*
	*
	*/
	TA_AROON          :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f64, inLow: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outAroonDown: [^]f64, outAroonUp: [^]f64) -> TA_RetCode ---
	TA_S_AROON        :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f32, inLow: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outAroonDown: [^]f64, outAroonUp: [^]f64) -> TA_RetCode ---
	TA_AROON_Lookback :: proc(optInTimePeriod: i32 /* From 2 to 100000 */) -> i32 --- /* From 2 to 100000 */

	/*
	* TA_AROONOSC - Aroon Oscillator
	*
	* Input  = High, Low
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 2 to 100000)
	*    Number of period
	*
	*
	*/
	TA_AROONOSC          :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f64, inLow: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_AROONOSC        :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f32, inLow: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_AROONOSC_Lookback :: proc(optInTimePeriod: i32 /* From 2 to 100000 */) -> i32 --- /* From 2 to 100000 */

	/*
	* TA_ASIN - Vector Trigonometric ASin
	*
	* Input  = double
	* Output = double
	*
	*/
	TA_ASIN          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_ASIN        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_ASIN_Lookback :: proc() -> i32 ---

	/*
	* TA_ATAN - Vector Trigonometric ATan
	*
	* Input  = double
	* Output = double
	*
	*/
	TA_ATAN          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_ATAN        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_ATAN_Lookback :: proc() -> i32 ---

	/*
	* TA_ATR - Average True Range
	*
	* Input  = High, Low, Close
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 1 to 100000)
	*    Number of period
	*
	*
	*/
	TA_ATR          :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_ATR        :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_ATR_Lookback :: proc(optInTimePeriod: i32 /* From 1 to 100000 */) -> i32 --- /* From 1 to 100000 */

	/*
	* TA_AVGDEV - Average Deviation
	*
	* Input  = double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 2 to 100000)
	*    Number of period
	*
	*
	*/
	TA_AVGDEV          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_AVGDEV        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_AVGDEV_Lookback :: proc(optInTimePeriod: i32 /* From 2 to 100000 */) -> i32 --- /* From 2 to 100000 */

	/*
	* TA_AVGPRICE - Average Price
	*
	* Input  = Open, High, Low, Close
	* Output = double
	*
	*/
	TA_AVGPRICE          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_AVGPRICE        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_AVGPRICE_Lookback :: proc() -> i32 ---

	/*
	* TA_BBANDS - Bollinger Bands
	*
	* Input  = double
	* Output = double, double, double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 2 to 100000)
	*    Number of period
	*
	* optInNbDevUp:(From TA_REAL_MIN to TA_REAL_MAX)
	*    Deviation multiplier for upper band
	*
	* optInNbDevDn:(From TA_REAL_MIN to TA_REAL_MAX)
	*    Deviation multiplier for lower band
	*
	* optInMAType:
	*    Type of Moving Average
	*
	*
	*/
	TA_BBANDS          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, optInNbDevUp: f64, optInNbDevDn: f64, optInMAType: TA_MAType, outBegIdx: ^i32, outNBElement: ^i32, outRealUpperBand: [^]f64, outRealMiddleBand: [^]f64, outRealLowerBand: [^]f64) -> TA_RetCode ---
	TA_S_BBANDS        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, optInNbDevUp: f64, optInNbDevDn: f64, optInMAType: TA_MAType, outBegIdx: ^i32, outNBElement: ^i32, outRealUpperBand: [^]f64, outRealMiddleBand: [^]f64, outRealLowerBand: [^]f64) -> TA_RetCode ---
	TA_BBANDS_Lookback :: proc(optInTimePeriod: i32, optInNbDevUp: f64, optInNbDevDn: f64, optInMAType: TA_MAType) -> i32 ---

	/*
	* TA_BETA - Beta
	*
	* Input  = double, double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 1 to 100000)
	*    Number of period
	*
	*
	*/
	TA_BETA          :: proc(startIdx: i32, endIdx: i32, inReal0: [^]f64, inReal1: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_BETA        :: proc(startIdx: i32, endIdx: i32, inReal0: [^]f32, inReal1: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_BETA_Lookback :: proc(optInTimePeriod: i32 /* From 1 to 100000 */) -> i32 --- /* From 1 to 100000 */

	/*
	* TA_BOP - Balance Of Power
	*
	* Input  = Open, High, Low, Close
	* Output = double
	*
	*/
	TA_BOP          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_BOP        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_BOP_Lookback :: proc() -> i32 ---

	/*
	* TA_CCI - Commodity Channel Index
	*
	* Input  = High, Low, Close
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 2 to 100000)
	*    Number of period
	*
	*
	*/
	TA_CCI          :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_CCI        :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_CCI_Lookback :: proc(optInTimePeriod: i32 /* From 2 to 100000 */) -> i32 --- /* From 2 to 100000 */

	/*
	* TA_CDL2CROWS - Two Crows
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDL2CROWS          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDL2CROWS        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDL2CROWS_Lookback :: proc() -> i32 ---

	/*
	* TA_CDL3BLACKCROWS - Three Black Crows
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDL3BLACKCROWS          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDL3BLACKCROWS        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDL3BLACKCROWS_Lookback :: proc() -> i32 ---

	/*
	* TA_CDL3INSIDE - Three Inside Up/Down
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDL3INSIDE          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDL3INSIDE        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDL3INSIDE_Lookback :: proc() -> i32 ---

	/*
	* TA_CDL3LINESTRIKE - Three-Line Strike
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDL3LINESTRIKE          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDL3LINESTRIKE        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDL3LINESTRIKE_Lookback :: proc() -> i32 ---

	/*
	* TA_CDL3OUTSIDE - Three Outside Up/Down
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDL3OUTSIDE          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDL3OUTSIDE        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDL3OUTSIDE_Lookback :: proc() -> i32 ---

	/*
	* TA_CDL3STARSINSOUTH - Three Stars In The South
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDL3STARSINSOUTH          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDL3STARSINSOUTH        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDL3STARSINSOUTH_Lookback :: proc() -> i32 ---

	/*
	* TA_CDL3WHITESOLDIERS - Three Advancing White Soldiers
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDL3WHITESOLDIERS          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDL3WHITESOLDIERS        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDL3WHITESOLDIERS_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLABANDONEDBABY - Abandoned Baby
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	* Optional Parameters
	* -------------------
	* optInPenetration:(From 0 to TA_REAL_MAX)
	*    Percentage of penetration of a candle within another candle
	*
	*
	*/
	TA_CDLABANDONEDBABY          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, optInPenetration: f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLABANDONEDBABY        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, optInPenetration: f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLABANDONEDBABY_Lookback :: proc(optInPenetration: f64 /* From 0 to TA_REAL_MAX */) -> i32 --- /* From 0 to TA_REAL_MAX */

	/*
	* TA_CDLADVANCEBLOCK - Advance Block
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLADVANCEBLOCK          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLADVANCEBLOCK        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLADVANCEBLOCK_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLBELTHOLD - Belt-hold
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLBELTHOLD          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLBELTHOLD        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLBELTHOLD_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLBREAKAWAY - Breakaway
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLBREAKAWAY          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLBREAKAWAY        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLBREAKAWAY_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLCLOSINGMARUBOZU - Closing Marubozu
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLCLOSINGMARUBOZU          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLCLOSINGMARUBOZU        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLCLOSINGMARUBOZU_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLCONCEALBABYSWALL - Concealing Baby Swallow
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLCONCEALBABYSWALL          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLCONCEALBABYSWALL        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLCONCEALBABYSWALL_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLCOUNTERATTACK - Counterattack
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLCOUNTERATTACK          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLCOUNTERATTACK        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLCOUNTERATTACK_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLDARKCLOUDCOVER - Dark Cloud Cover
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	* Optional Parameters
	* -------------------
	* optInPenetration:(From 0 to TA_REAL_MAX)
	*    Percentage of penetration of a candle within another candle
	*
	*
	*/
	TA_CDLDARKCLOUDCOVER          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, optInPenetration: f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLDARKCLOUDCOVER        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, optInPenetration: f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLDARKCLOUDCOVER_Lookback :: proc(optInPenetration: f64 /* From 0 to TA_REAL_MAX */) -> i32 --- /* From 0 to TA_REAL_MAX */

	/*
	* TA_CDLDOJI - Doji
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLDOJI          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLDOJI        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLDOJI_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLDOJISTAR - Doji Star
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLDOJISTAR          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLDOJISTAR        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLDOJISTAR_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLDRAGONFLYDOJI - Dragonfly Doji
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLDRAGONFLYDOJI          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLDRAGONFLYDOJI        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLDRAGONFLYDOJI_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLENGULFING - Engulfing Pattern
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLENGULFING          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLENGULFING        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLENGULFING_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLEVENINGDOJISTAR - Evening Doji Star
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	* Optional Parameters
	* -------------------
	* optInPenetration:(From 0 to TA_REAL_MAX)
	*    Percentage of penetration of a candle within another candle
	*
	*
	*/
	TA_CDLEVENINGDOJISTAR          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, optInPenetration: f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLEVENINGDOJISTAR        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, optInPenetration: f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLEVENINGDOJISTAR_Lookback :: proc(optInPenetration: f64 /* From 0 to TA_REAL_MAX */) -> i32 --- /* From 0 to TA_REAL_MAX */

	/*
	* TA_CDLEVENINGSTAR - Evening Star
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	* Optional Parameters
	* -------------------
	* optInPenetration:(From 0 to TA_REAL_MAX)
	*    Percentage of penetration of a candle within another candle
	*
	*
	*/
	TA_CDLEVENINGSTAR          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, optInPenetration: f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLEVENINGSTAR        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, optInPenetration: f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLEVENINGSTAR_Lookback :: proc(optInPenetration: f64 /* From 0 to TA_REAL_MAX */) -> i32 --- /* From 0 to TA_REAL_MAX */

	/*
	* TA_CDLGAPSIDESIDEWHITE - Up/Down-gap side-by-side white lines
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLGAPSIDESIDEWHITE          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLGAPSIDESIDEWHITE        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLGAPSIDESIDEWHITE_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLGRAVESTONEDOJI - Gravestone Doji
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLGRAVESTONEDOJI          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLGRAVESTONEDOJI        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLGRAVESTONEDOJI_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLHAMMER - Hammer
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLHAMMER          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLHAMMER        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLHAMMER_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLHANGINGMAN - Hanging Man
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLHANGINGMAN          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLHANGINGMAN        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLHANGINGMAN_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLHARAMI - Harami Pattern
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLHARAMI          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLHARAMI        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLHARAMI_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLHARAMICROSS - Harami Cross Pattern
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLHARAMICROSS          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLHARAMICROSS        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLHARAMICROSS_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLHIGHWAVE - High-Wave Candle
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLHIGHWAVE          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLHIGHWAVE        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLHIGHWAVE_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLHIKKAKE - Hikkake Pattern
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLHIKKAKE          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLHIKKAKE        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLHIKKAKE_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLHIKKAKEMOD - Modified Hikkake Pattern
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLHIKKAKEMOD          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLHIKKAKEMOD        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLHIKKAKEMOD_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLHOMINGPIGEON - Homing Pigeon
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLHOMINGPIGEON          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLHOMINGPIGEON        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLHOMINGPIGEON_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLIDENTICAL3CROWS - Identical Three Crows
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLIDENTICAL3CROWS          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLIDENTICAL3CROWS        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLIDENTICAL3CROWS_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLINNECK - In-Neck Pattern
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLINNECK          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLINNECK        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLINNECK_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLINVERTEDHAMMER - Inverted Hammer
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLINVERTEDHAMMER          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLINVERTEDHAMMER        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLINVERTEDHAMMER_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLKICKING - Kicking
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLKICKING          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLKICKING        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLKICKING_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLKICKINGBYLENGTH - Kicking - bull/bear determined by the longer marubozu
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLKICKINGBYLENGTH          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLKICKINGBYLENGTH        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLKICKINGBYLENGTH_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLLADDERBOTTOM - Ladder Bottom
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLLADDERBOTTOM          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLLADDERBOTTOM        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLLADDERBOTTOM_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLLONGLEGGEDDOJI - Long Legged Doji
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLLONGLEGGEDDOJI          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLLONGLEGGEDDOJI        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLLONGLEGGEDDOJI_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLLONGLINE - Long Line Candle
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLLONGLINE          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLLONGLINE        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLLONGLINE_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLMARUBOZU - Marubozu
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLMARUBOZU          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLMARUBOZU        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLMARUBOZU_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLMATCHINGLOW - Matching Low
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLMATCHINGLOW          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLMATCHINGLOW        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLMATCHINGLOW_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLMATHOLD - Mat Hold
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	* Optional Parameters
	* -------------------
	* optInPenetration:(From 0 to TA_REAL_MAX)
	*    Percentage of penetration of a candle within another candle
	*
	*
	*/
	TA_CDLMATHOLD          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, optInPenetration: f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLMATHOLD        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, optInPenetration: f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLMATHOLD_Lookback :: proc(optInPenetration: f64 /* From 0 to TA_REAL_MAX */) -> i32 --- /* From 0 to TA_REAL_MAX */

	/*
	* TA_CDLMORNINGDOJISTAR - Morning Doji Star
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	* Optional Parameters
	* -------------------
	* optInPenetration:(From 0 to TA_REAL_MAX)
	*    Percentage of penetration of a candle within another candle
	*
	*
	*/
	TA_CDLMORNINGDOJISTAR          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, optInPenetration: f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLMORNINGDOJISTAR        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, optInPenetration: f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLMORNINGDOJISTAR_Lookback :: proc(optInPenetration: f64 /* From 0 to TA_REAL_MAX */) -> i32 --- /* From 0 to TA_REAL_MAX */

	/*
	* TA_CDLMORNINGSTAR - Morning Star
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	* Optional Parameters
	* -------------------
	* optInPenetration:(From 0 to TA_REAL_MAX)
	*    Percentage of penetration of a candle within another candle
	*
	*
	*/
	TA_CDLMORNINGSTAR          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, optInPenetration: f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLMORNINGSTAR        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, optInPenetration: f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLMORNINGSTAR_Lookback :: proc(optInPenetration: f64 /* From 0 to TA_REAL_MAX */) -> i32 --- /* From 0 to TA_REAL_MAX */

	/*
	* TA_CDLONNECK - On-Neck Pattern
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLONNECK          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLONNECK        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLONNECK_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLPIERCING - Piercing Pattern
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLPIERCING          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLPIERCING        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLPIERCING_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLRICKSHAWMAN - Rickshaw Man
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLRICKSHAWMAN          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLRICKSHAWMAN        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLRICKSHAWMAN_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLRISEFALL3METHODS - Rising/Falling Three Methods
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLRISEFALL3METHODS          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLRISEFALL3METHODS        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLRISEFALL3METHODS_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLSEPARATINGLINES - Separating Lines
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLSEPARATINGLINES          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLSEPARATINGLINES        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLSEPARATINGLINES_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLSHOOTINGSTAR - Shooting Star
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLSHOOTINGSTAR          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLSHOOTINGSTAR        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLSHOOTINGSTAR_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLSHORTLINE - Short Line Candle
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLSHORTLINE          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLSHORTLINE        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLSHORTLINE_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLSPINNINGTOP - Spinning Top
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLSPINNINGTOP          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLSPINNINGTOP        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLSPINNINGTOP_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLSTALLEDPATTERN - Stalled Pattern
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLSTALLEDPATTERN          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLSTALLEDPATTERN        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLSTALLEDPATTERN_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLSTICKSANDWICH - Stick Sandwich
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLSTICKSANDWICH          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLSTICKSANDWICH        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLSTICKSANDWICH_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLTAKURI - Takuri (Dragonfly Doji with very long lower shadow)
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLTAKURI          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLTAKURI        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLTAKURI_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLTASUKIGAP - Tasuki Gap
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLTASUKIGAP          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLTASUKIGAP        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLTASUKIGAP_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLTHRUSTING - Thrusting Pattern
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLTHRUSTING          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLTHRUSTING        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLTHRUSTING_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLTRISTAR - Tristar Pattern
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLTRISTAR          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLTRISTAR        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLTRISTAR_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLUNIQUE3RIVER - Unique 3 River
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLUNIQUE3RIVER          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLUNIQUE3RIVER        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLUNIQUE3RIVER_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLUPSIDEGAP2CROWS - Upside Gap Two Crows
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLUPSIDEGAP2CROWS          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLUPSIDEGAP2CROWS        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLUPSIDEGAP2CROWS_Lookback :: proc() -> i32 ---

	/*
	* TA_CDLXSIDEGAP3METHODS - Upside/Downside Gap Three Methods
	*
	* Input  = Open, High, Low, Close
	* Output = int
	*
	*/
	TA_CDLXSIDEGAP3METHODS          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_CDLXSIDEGAP3METHODS        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_CDLXSIDEGAP3METHODS_Lookback :: proc() -> i32 ---

	/*
	* TA_CEIL - Vector Ceil
	*
	* Input  = double
	* Output = double
	*
	*/
	TA_CEIL          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_CEIL        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_CEIL_Lookback :: proc() -> i32 ---

	/*
	* TA_CMO - Chande Momentum Oscillator
	*
	* Input  = double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 2 to 100000)
	*    Number of period
	*
	*
	*/
	TA_CMO          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_CMO        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_CMO_Lookback :: proc(optInTimePeriod: i32 /* From 2 to 100000 */) -> i32 --- /* From 2 to 100000 */

	/*
	* TA_CORREL - Pearson's Correlation Coefficient (r)
	*
	* Input  = double, double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 1 to 100000)
	*    Number of period
	*
	*
	*/
	TA_CORREL          :: proc(startIdx: i32, endIdx: i32, inReal0: [^]f64, inReal1: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_CORREL        :: proc(startIdx: i32, endIdx: i32, inReal0: [^]f32, inReal1: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_CORREL_Lookback :: proc(optInTimePeriod: i32 /* From 1 to 100000 */) -> i32 --- /* From 1 to 100000 */

	/*
	* TA_COS - Vector Trigonometric Cos
	*
	* Input  = double
	* Output = double
	*
	*/
	TA_COS          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_COS        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_COS_Lookback :: proc() -> i32 ---

	/*
	* TA_COSH - Vector Trigonometric Cosh
	*
	* Input  = double
	* Output = double
	*
	*/
	TA_COSH          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_COSH        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_COSH_Lookback :: proc() -> i32 ---

	/*
	* TA_DEMA - Double Exponential Moving Average
	*
	* Input  = double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 1 to 100000)
	*    Number of period
	*
	*
	*/
	TA_DEMA          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_DEMA        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_DEMA_Lookback :: proc(optInTimePeriod: i32 /* From 1 to 100000 */) -> i32 --- /* From 1 to 100000 */

	/*
	* TA_DIV - Vector Arithmetic Div
	*
	* Input  = double, double
	* Output = double
	*
	*/
	TA_DIV          :: proc(startIdx: i32, endIdx: i32, inReal0: [^]f64, inReal1: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_DIV        :: proc(startIdx: i32, endIdx: i32, inReal0: [^]f32, inReal1: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_DIV_Lookback :: proc() -> i32 ---

	/*
	* TA_DX - Directional Movement Index
	*
	* Input  = High, Low, Close
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 2 to 100000)
	*    Number of period
	*
	*
	*/
	TA_DX          :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_DX        :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_DX_Lookback :: proc(optInTimePeriod: i32 /* From 2 to 100000 */) -> i32 --- /* From 2 to 100000 */

	/*
	* TA_EMA - Exponential Moving Average
	*
	* Input  = double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 1 to 100000)
	*    Number of period
	*
	*
	*/
	TA_EMA          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_EMA        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_EMA_Lookback :: proc(optInTimePeriod: i32 /* From 1 to 100000 */) -> i32 --- /* From 1 to 100000 */

	/*
	* TA_EXP - Vector Arithmetic Exp
	*
	* Input  = double
	* Output = double
	*
	*/
	TA_EXP          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_EXP        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_EXP_Lookback :: proc() -> i32 ---

	/*
	* TA_FLOOR - Vector Floor
	*
	* Input  = double
	* Output = double
	*
	*/
	TA_FLOOR          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_FLOOR        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_FLOOR_Lookback :: proc() -> i32 ---

	/*
	* TA_HT_DCPERIOD - Hilbert Transform - Dominant Cycle Period
	*
	* Input  = double
	* Output = double
	*
	*/
	TA_HT_DCPERIOD          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_HT_DCPERIOD        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_HT_DCPERIOD_Lookback :: proc() -> i32 ---

	/*
	* TA_HT_DCPHASE - Hilbert Transform - Dominant Cycle Phase
	*
	* Input  = double
	* Output = double
	*
	*/
	TA_HT_DCPHASE          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_HT_DCPHASE        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_HT_DCPHASE_Lookback :: proc() -> i32 ---

	/*
	* TA_HT_PHASOR - Hilbert Transform - Phasor Components
	*
	* Input  = double
	* Output = double, double
	*
	*/
	TA_HT_PHASOR          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInPhase: [^]f64, outQuadrature: [^]f64) -> TA_RetCode ---
	TA_S_HT_PHASOR        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInPhase: [^]f64, outQuadrature: [^]f64) -> TA_RetCode ---
	TA_HT_PHASOR_Lookback :: proc() -> i32 ---

	/*
	* TA_HT_SINE - Hilbert Transform - SineWave
	*
	* Input  = double
	* Output = double, double
	*
	*/
	TA_HT_SINE          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outSine: [^]f64, outLeadSine: [^]f64) -> TA_RetCode ---
	TA_S_HT_SINE        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outSine: [^]f64, outLeadSine: [^]f64) -> TA_RetCode ---
	TA_HT_SINE_Lookback :: proc() -> i32 ---

	/*
	* TA_HT_TRENDLINE - Hilbert Transform - Instantaneous Trendline
	*
	* Input  = double
	* Output = double
	*
	*/
	TA_HT_TRENDLINE          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_HT_TRENDLINE        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_HT_TRENDLINE_Lookback :: proc() -> i32 ---

	/*
	* TA_HT_TRENDMODE - Hilbert Transform - Trend vs Cycle Mode
	*
	* Input  = double
	* Output = int
	*
	*/
	TA_HT_TRENDMODE          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_HT_TRENDMODE        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_HT_TRENDMODE_Lookback :: proc() -> i32 ---

	/*
	* TA_IMI - Intraday Momentum Index
	*
	* Input  = Open, Close
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 2 to 100000)
	*    Number of period
	*
	*
	*/
	TA_IMI          :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f64, inClose: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_IMI        :: proc(startIdx: i32, endIdx: i32, inOpen: [^]f32, inClose: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_IMI_Lookback :: proc(optInTimePeriod: i32 /* From 2 to 100000 */) -> i32 --- /* From 2 to 100000 */

	/*
	* TA_KAMA - Kaufman Adaptive Moving Average
	*
	* Input  = double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 1 to 100000)
	*    Number of period
	*
	*
	*/
	TA_KAMA          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_KAMA        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_KAMA_Lookback :: proc(optInTimePeriod: i32 /* From 1 to 100000 */) -> i32 --- /* From 1 to 100000 */

	/*
	* TA_LINEARREG - Linear Regression
	*
	* Input  = double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 2 to 100000)
	*    Number of period
	*
	*
	*/
	TA_LINEARREG          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_LINEARREG        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_LINEARREG_Lookback :: proc(optInTimePeriod: i32 /* From 2 to 100000 */) -> i32 --- /* From 2 to 100000 */

	/*
	* TA_LINEARREG_ANGLE - Linear Regression Angle
	*
	* Input  = double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 2 to 100000)
	*    Number of period
	*
	*
	*/
	TA_LINEARREG_ANGLE          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_LINEARREG_ANGLE        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_LINEARREG_ANGLE_Lookback :: proc(optInTimePeriod: i32 /* From 2 to 100000 */) -> i32 --- /* From 2 to 100000 */

	/*
	* TA_LINEARREG_INTERCEPT - Linear Regression Intercept
	*
	* Input  = double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 2 to 100000)
	*    Number of period
	*
	*
	*/
	TA_LINEARREG_INTERCEPT          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_LINEARREG_INTERCEPT        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_LINEARREG_INTERCEPT_Lookback :: proc(optInTimePeriod: i32 /* From 2 to 100000 */) -> i32 --- /* From 2 to 100000 */

	/*
	* TA_LINEARREG_SLOPE - Linear Regression Slope
	*
	* Input  = double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 2 to 100000)
	*    Number of period
	*
	*
	*/
	TA_LINEARREG_SLOPE          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_LINEARREG_SLOPE        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_LINEARREG_SLOPE_Lookback :: proc(optInTimePeriod: i32 /* From 2 to 100000 */) -> i32 --- /* From 2 to 100000 */

	/*
	* TA_LN - Vector Log Natural
	*
	* Input  = double
	* Output = double
	*
	*/
	TA_LN          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_LN        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_LN_Lookback :: proc() -> i32 ---

	/*
	* TA_LOG10 - Vector Log10
	*
	* Input  = double
	* Output = double
	*
	*/
	TA_LOG10          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_LOG10        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_LOG10_Lookback :: proc() -> i32 ---

	/*
	* TA_MA - Moving average
	*
	* Input  = double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 1 to 100000)
	*    Number of period
	*
	* optInMAType:
	*    Type of Moving Average
	*
	*
	*/
	TA_MA          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, optInMAType: TA_MAType, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_MA        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, optInMAType: TA_MAType, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_MA_Lookback :: proc(optInTimePeriod: i32, optInMAType: TA_MAType) -> i32 ---

	/*
	* TA_MACD - Moving Average Convergence/Divergence
	*
	* Input  = double
	* Output = double, double, double
	*
	* Optional Parameters
	* -------------------
	* optInFastPeriod:(From 2 to 100000)
	*    Number of period for the fast MA
	*
	* optInSlowPeriod:(From 2 to 100000)
	*    Number of period for the slow MA
	*
	* optInSignalPeriod:(From 1 to 100000)
	*    Smoothing for the signal line (nb of period)
	*
	*
	*/
	TA_MACD          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInFastPeriod: i32, optInSlowPeriod: i32, optInSignalPeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outMACD: [^]f64, outMACDSignal: [^]f64, outMACDHist: [^]f64) -> TA_RetCode ---
	TA_S_MACD        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInFastPeriod: i32, optInSlowPeriod: i32, optInSignalPeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outMACD: [^]f64, outMACDSignal: [^]f64, outMACDHist: [^]f64) -> TA_RetCode ---
	TA_MACD_Lookback :: proc(optInFastPeriod: i32, optInSlowPeriod: i32, optInSignalPeriod: i32 /* From 1 to 100000 */) -> i32 --- /* From 1 to 100000 */

	/*
	* TA_MACDEXT - MACD with controllable MA type
	*
	* Input  = double
	* Output = double, double, double
	*
	* Optional Parameters
	* -------------------
	* optInFastPeriod:(From 2 to 100000)
	*    Number of period for the fast MA
	*
	* optInFastMAType:
	*    Type of Moving Average for fast MA
	*
	* optInSlowPeriod:(From 2 to 100000)
	*    Number of period for the slow MA
	*
	* optInSlowMAType:
	*    Type of Moving Average for slow MA
	*
	* optInSignalPeriod:(From 1 to 100000)
	*    Smoothing for the signal line (nb of period)
	*
	* optInSignalMAType:
	*    Type of Moving Average for signal line
	*
	*
	*/
	TA_MACDEXT          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInFastPeriod: i32, optInFastMAType: TA_MAType, optInSlowPeriod: i32, optInSlowMAType: TA_MAType, optInSignalPeriod: i32, optInSignalMAType: TA_MAType, outBegIdx: ^i32, outNBElement: ^i32, outMACD: [^]f64, outMACDSignal: [^]f64, outMACDHist: [^]f64) -> TA_RetCode ---
	TA_S_MACDEXT        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInFastPeriod: i32, optInFastMAType: TA_MAType, optInSlowPeriod: i32, optInSlowMAType: TA_MAType, optInSignalPeriod: i32, optInSignalMAType: TA_MAType, outBegIdx: ^i32, outNBElement: ^i32, outMACD: [^]f64, outMACDSignal: [^]f64, outMACDHist: [^]f64) -> TA_RetCode ---
	TA_MACDEXT_Lookback :: proc(optInFastPeriod: i32, optInFastMAType: TA_MAType, optInSlowPeriod: i32, optInSlowMAType: TA_MAType, optInSignalPeriod: i32, optInSignalMAType: TA_MAType) -> i32 ---

	/*
	* TA_MACDFIX - Moving Average Convergence/Divergence Fix 12/26
	*
	* Input  = double
	* Output = double, double, double
	*
	* Optional Parameters
	* -------------------
	* optInSignalPeriod:(From 1 to 100000)
	*    Smoothing for the signal line (nb of period)
	*
	*
	*/
	TA_MACDFIX          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInSignalPeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outMACD: [^]f64, outMACDSignal: [^]f64, outMACDHist: [^]f64) -> TA_RetCode ---
	TA_S_MACDFIX        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInSignalPeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outMACD: [^]f64, outMACDSignal: [^]f64, outMACDHist: [^]f64) -> TA_RetCode ---
	TA_MACDFIX_Lookback :: proc(optInSignalPeriod: i32 /* From 1 to 100000 */) -> i32 --- /* From 1 to 100000 */

	/*
	* TA_MAMA - MESA Adaptive Moving Average
	*
	* Input  = double
	* Output = double, double
	*
	* Optional Parameters
	* -------------------
	* optInFastLimit:(From 0.01 to 0.99)
	*    Upper limit use in the adaptive algorithm
	*
	* optInSlowLimit:(From 0.01 to 0.99)
	*    Lower limit use in the adaptive algorithm
	*
	*
	*/
	TA_MAMA          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInFastLimit: f64, optInSlowLimit: f64, outBegIdx: ^i32, outNBElement: ^i32, outMAMA: [^]f64, outFAMA: [^]f64) -> TA_RetCode ---
	TA_S_MAMA        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInFastLimit: f64, optInSlowLimit: f64, outBegIdx: ^i32, outNBElement: ^i32, outMAMA: [^]f64, outFAMA: [^]f64) -> TA_RetCode ---
	TA_MAMA_Lookback :: proc(optInFastLimit: f64, optInSlowLimit: f64 /* From 0.01 to 0.99 */) -> i32 --- /* From 0.01 to 0.99 */

	/*
	* TA_MAVP - Moving average with variable period
	*
	* Input  = double, double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInMinPeriod:(From 1 to 100000)
	*    Value less than minimum will be changed to Minimum period
	*
	* optInMaxPeriod:(From 1 to 100000)
	*    Value higher than maximum will be changed to Maximum period
	*
	* optInMAType:
	*    Type of Moving Average
	*
	*
	*/
	TA_MAVP          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, inPeriods: [^]f64, optInMinPeriod: i32, optInMaxPeriod: i32, optInMAType: TA_MAType, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_MAVP        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, inPeriods: [^]f32, optInMinPeriod: i32, optInMaxPeriod: i32, optInMAType: TA_MAType, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_MAVP_Lookback :: proc(optInMinPeriod: i32, optInMaxPeriod: i32, optInMAType: TA_MAType) -> i32 ---

	/*
	* TA_MAX - Highest value over a specified period
	*
	* Input  = double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 2 to 100000)
	*    Number of period
	*
	*
	*/
	TA_MAX          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_MAX        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_MAX_Lookback :: proc(optInTimePeriod: i32 /* From 2 to 100000 */) -> i32 --- /* From 2 to 100000 */

	/*
	* TA_MAXINDEX - Index of highest value over a specified period
	*
	* Input  = double
	* Output = int
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 2 to 100000)
	*    Number of period
	*
	*
	*/
	TA_MAXINDEX          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_MAXINDEX        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_MAXINDEX_Lookback :: proc(optInTimePeriod: i32 /* From 2 to 100000 */) -> i32 --- /* From 2 to 100000 */

	/*
	* TA_MEDPRICE - Median Price
	*
	* Input  = High, Low
	* Output = double
	*
	*/
	TA_MEDPRICE          :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f64, inLow: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_MEDPRICE        :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f32, inLow: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_MEDPRICE_Lookback :: proc() -> i32 ---

	/*
	* TA_MFI - Money Flow Index
	*
	* Input  = High, Low, Close, Volume
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 2 to 100000)
	*    Number of period
	*
	*
	*/
	TA_MFI          :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, inVolume: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_MFI        :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, inVolume: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_MFI_Lookback :: proc(optInTimePeriod: i32 /* From 2 to 100000 */) -> i32 --- /* From 2 to 100000 */

	/*
	* TA_MIDPOINT - MidPoint over period
	*
	* Input  = double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 2 to 100000)
	*    Number of period
	*
	*
	*/
	TA_MIDPOINT          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_MIDPOINT        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_MIDPOINT_Lookback :: proc(optInTimePeriod: i32 /* From 2 to 100000 */) -> i32 --- /* From 2 to 100000 */

	/*
	* TA_MIDPRICE - Midpoint Price over period
	*
	* Input  = High, Low
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 2 to 100000)
	*    Number of period
	*
	*
	*/
	TA_MIDPRICE          :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f64, inLow: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_MIDPRICE        :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f32, inLow: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_MIDPRICE_Lookback :: proc(optInTimePeriod: i32 /* From 2 to 100000 */) -> i32 --- /* From 2 to 100000 */

	/*
	* TA_MIN - Lowest value over a specified period
	*
	* Input  = double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 2 to 100000)
	*    Number of period
	*
	*
	*/
	TA_MIN          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_MIN        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_MIN_Lookback :: proc(optInTimePeriod: i32 /* From 2 to 100000 */) -> i32 --- /* From 2 to 100000 */

	/*
	* TA_MININDEX - Index of lowest value over a specified period
	*
	* Input  = double
	* Output = int
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 2 to 100000)
	*    Number of period
	*
	*
	*/
	TA_MININDEX          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_S_MININDEX        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outInteger: [^]i32) -> TA_RetCode ---
	TA_MININDEX_Lookback :: proc(optInTimePeriod: i32 /* From 2 to 100000 */) -> i32 --- /* From 2 to 100000 */

	/*
	* TA_MINMAX - Lowest and highest values over a specified period
	*
	* Input  = double
	* Output = double, double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 2 to 100000)
	*    Number of period
	*
	*
	*/
	TA_MINMAX          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outMin: [^]f64, outMax: [^]f64) -> TA_RetCode ---
	TA_S_MINMAX        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outMin: [^]f64, outMax: [^]f64) -> TA_RetCode ---
	TA_MINMAX_Lookback :: proc(optInTimePeriod: i32 /* From 2 to 100000 */) -> i32 --- /* From 2 to 100000 */

	/*
	* TA_MINMAXINDEX - Indexes of lowest and highest values over a specified period
	*
	* Input  = double
	* Output = int, int
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 2 to 100000)
	*    Number of period
	*
	*
	*/
	TA_MINMAXINDEX          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outMinIdx: [^]i32, outMaxIdx: [^]i32) -> TA_RetCode ---
	TA_S_MINMAXINDEX        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outMinIdx: [^]i32, outMaxIdx: [^]i32) -> TA_RetCode ---
	TA_MINMAXINDEX_Lookback :: proc(optInTimePeriod: i32 /* From 2 to 100000 */) -> i32 --- /* From 2 to 100000 */

	/*
	* TA_MINUS_DI - Minus Directional Indicator
	*
	* Input  = High, Low, Close
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 1 to 100000)
	*    Number of period
	*
	*
	*/
	TA_MINUS_DI          :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_MINUS_DI        :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_MINUS_DI_Lookback :: proc(optInTimePeriod: i32 /* From 1 to 100000 */) -> i32 --- /* From 1 to 100000 */

	/*
	* TA_MINUS_DM - Minus Directional Movement
	*
	* Input  = High, Low
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 1 to 100000)
	*    Number of period
	*
	*
	*/
	TA_MINUS_DM          :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f64, inLow: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_MINUS_DM        :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f32, inLow: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_MINUS_DM_Lookback :: proc(optInTimePeriod: i32 /* From 1 to 100000 */) -> i32 --- /* From 1 to 100000 */

	/*
	* TA_MOM - Momentum
	*
	* Input  = double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 1 to 100000)
	*    Number of period
	*
	*
	*/
	TA_MOM          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_MOM        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_MOM_Lookback :: proc(optInTimePeriod: i32 /* From 1 to 100000 */) -> i32 --- /* From 1 to 100000 */

	/*
	* TA_MULT - Vector Arithmetic Mult
	*
	* Input  = double, double
	* Output = double
	*
	*/
	TA_MULT          :: proc(startIdx: i32, endIdx: i32, inReal0: [^]f64, inReal1: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_MULT        :: proc(startIdx: i32, endIdx: i32, inReal0: [^]f32, inReal1: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_MULT_Lookback :: proc() -> i32 ---

	/*
	* TA_NATR - Normalized Average True Range
	*
	* Input  = High, Low, Close
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 1 to 100000)
	*    Number of period
	*
	*
	*/
	TA_NATR          :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_NATR        :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_NATR_Lookback :: proc(optInTimePeriod: i32 /* From 1 to 100000 */) -> i32 --- /* From 1 to 100000 */

	/*
	* TA_OBV - On Balance Volume
	*
	* Input  = double, Volume
	* Output = double
	*
	*/
	TA_OBV          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, inVolume: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_OBV        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, inVolume: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_OBV_Lookback :: proc() -> i32 ---

	/*
	* TA_PLUS_DI - Plus Directional Indicator
	*
	* Input  = High, Low, Close
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 1 to 100000)
	*    Number of period
	*
	*
	*/
	TA_PLUS_DI          :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_PLUS_DI        :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_PLUS_DI_Lookback :: proc(optInTimePeriod: i32 /* From 1 to 100000 */) -> i32 --- /* From 1 to 100000 */

	/*
	* TA_PLUS_DM - Plus Directional Movement
	*
	* Input  = High, Low
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 1 to 100000)
	*    Number of period
	*
	*
	*/
	TA_PLUS_DM          :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f64, inLow: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_PLUS_DM        :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f32, inLow: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_PLUS_DM_Lookback :: proc(optInTimePeriod: i32 /* From 1 to 100000 */) -> i32 --- /* From 1 to 100000 */

	/*
	* TA_PPO - Percentage Price Oscillator
	*
	* Input  = double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInFastPeriod:(From 2 to 100000)
	*    Number of period for the fast MA
	*
	* optInSlowPeriod:(From 2 to 100000)
	*    Number of period for the slow MA
	*
	* optInMAType:
	*    Type of Moving Average
	*
	*
	*/
	TA_PPO          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInFastPeriod: i32, optInSlowPeriod: i32, optInMAType: TA_MAType, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_PPO        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInFastPeriod: i32, optInSlowPeriod: i32, optInMAType: TA_MAType, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_PPO_Lookback :: proc(optInFastPeriod: i32, optInSlowPeriod: i32, optInMAType: TA_MAType) -> i32 ---

	/*
	* TA_ROC - Rate of change : ((price/prevPrice)-1)*100
	*
	* Input  = double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 1 to 100000)
	*    Number of period
	*
	*
	*/
	TA_ROC          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_ROC        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_ROC_Lookback :: proc(optInTimePeriod: i32 /* From 1 to 100000 */) -> i32 --- /* From 1 to 100000 */

	/*
	* TA_ROCP - Rate of change Percentage: (price-prevPrice)/prevPrice
	*
	* Input  = double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 1 to 100000)
	*    Number of period
	*
	*
	*/
	TA_ROCP          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_ROCP        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_ROCP_Lookback :: proc(optInTimePeriod: i32 /* From 1 to 100000 */) -> i32 --- /* From 1 to 100000 */

	/*
	* TA_ROCR - Rate of change ratio: (price/prevPrice)
	*
	* Input  = double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 1 to 100000)
	*    Number of period
	*
	*
	*/
	TA_ROCR          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_ROCR        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_ROCR_Lookback :: proc(optInTimePeriod: i32 /* From 1 to 100000 */) -> i32 --- /* From 1 to 100000 */

	/*
	* TA_ROCR100 - Rate of change ratio 100 scale: (price/prevPrice)*100
	*
	* Input  = double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 1 to 100000)
	*    Number of period
	*
	*
	*/
	TA_ROCR100          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_ROCR100        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_ROCR100_Lookback :: proc(optInTimePeriod: i32 /* From 1 to 100000 */) -> i32 --- /* From 1 to 100000 */

	/*
	* TA_RSI - Relative Strength Index
	*
	* Input  = double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 2 to 100000)
	*    Number of period
	*
	*
	*/
	TA_RSI          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_RSI        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_RSI_Lookback :: proc(optInTimePeriod: i32 /* From 2 to 100000 */) -> i32 --- /* From 2 to 100000 */

	/*
	* TA_SAR - Parabolic SAR
	*
	* Input  = High, Low
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInAcceleration:(From 0 to TA_REAL_MAX)
	*    Acceleration Factor used up to the Maximum value
	*
	* optInMaximum:(From 0 to TA_REAL_MAX)
	*    Acceleration Factor Maximum value
	*
	*
	*/
	TA_SAR          :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f64, inLow: [^]f64, optInAcceleration: f64, optInMaximum: f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_SAR        :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f32, inLow: [^]f32, optInAcceleration: f64, optInMaximum: f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_SAR_Lookback :: proc(optInAcceleration: f64, optInMaximum: f64 /* From 0 to TA_REAL_MAX */) -> i32 --- /* From 0 to TA_REAL_MAX */

	/*
	* TA_SAREXT - Parabolic SAR - Extended
	*
	* Input  = High, Low
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInStartValue:(From TA_REAL_MIN to TA_REAL_MAX)
	*    Start value and direction. 0 for Auto, >0 for Long, <0 for Short
	*
	* optInOffsetOnReverse:(From 0 to TA_REAL_MAX)
	*    Percent offset added/removed to initial stop on short/long reversal
	*
	* optInAccelerationInitLong:(From 0 to TA_REAL_MAX)
	*    Acceleration Factor initial value for the Long direction
	*
	* optInAccelerationLong:(From 0 to TA_REAL_MAX)
	*    Acceleration Factor for the Long direction
	*
	* optInAccelerationMaxLong:(From 0 to TA_REAL_MAX)
	*    Acceleration Factor maximum value for the Long direction
	*
	* optInAccelerationInitShort:(From 0 to TA_REAL_MAX)
	*    Acceleration Factor initial value for the Short direction
	*
	* optInAccelerationShort:(From 0 to TA_REAL_MAX)
	*    Acceleration Factor for the Short direction
	*
	* optInAccelerationMaxShort:(From 0 to TA_REAL_MAX)
	*    Acceleration Factor maximum value for the Short direction
	*
	*
	*/
	TA_SAREXT          :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f64, inLow: [^]f64, optInStartValue: f64, optInOffsetOnReverse: f64, optInAccelerationInitLong: f64, optInAccelerationLong: f64, optInAccelerationMaxLong: f64, optInAccelerationInitShort: f64, optInAccelerationShort: f64, optInAccelerationMaxShort: f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_SAREXT        :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f32, inLow: [^]f32, optInStartValue: f64, optInOffsetOnReverse: f64, optInAccelerationInitLong: f64, optInAccelerationLong: f64, optInAccelerationMaxLong: f64, optInAccelerationInitShort: f64, optInAccelerationShort: f64, optInAccelerationMaxShort: f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_SAREXT_Lookback :: proc(optInStartValue: f64, optInOffsetOnReverse: f64, optInAccelerationInitLong: f64, optInAccelerationLong: f64, optInAccelerationMaxLong: f64, optInAccelerationInitShort: f64, optInAccelerationShort: f64, optInAccelerationMaxShort: f64 /* From 0 to TA_REAL_MAX */) -> i32 --- /* From 0 to TA_REAL_MAX */

	/*
	* TA_SIN - Vector Trigonometric Sin
	*
	* Input  = double
	* Output = double
	*
	*/
	TA_SIN          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_SIN        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_SIN_Lookback :: proc() -> i32 ---

	/*
	* TA_SINH - Vector Trigonometric Sinh
	*
	* Input  = double
	* Output = double
	*
	*/
	TA_SINH          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_SINH        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_SINH_Lookback :: proc() -> i32 ---

	/*
	* TA_SMA - Simple Moving Average
	*
	* Input  = double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 1 to 100000)
	*    Number of period
	*
	*
	*/
	TA_SMA          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_SMA        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_SMA_Lookback :: proc(optInTimePeriod: i32 /* From 1 to 100000 */) -> i32 --- /* From 1 to 100000 */

	/*
	* TA_SQRT - Vector Square Root
	*
	* Input  = double
	* Output = double
	*
	*/
	TA_SQRT          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_SQRT        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_SQRT_Lookback :: proc() -> i32 ---

	/*
	* TA_STDDEV - Standard Deviation
	*
	* Input  = double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 2 to 100000)
	*    Number of period
	*
	* optInNbDev:(From TA_REAL_MIN to TA_REAL_MAX)
	*    Nb of deviations
	*
	*
	*/
	TA_STDDEV          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, optInNbDev: f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_STDDEV        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, optInNbDev: f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_STDDEV_Lookback :: proc(optInTimePeriod: i32, optInNbDev: f64 /* From TA_REAL_MIN to TA_REAL_MAX */) -> i32 --- /* From TA_REAL_MIN to TA_REAL_MAX */

	/*
	* TA_STOCH - Stochastic
	*
	* Input  = High, Low, Close
	* Output = double, double
	*
	* Optional Parameters
	* -------------------
	* optInFastK_Period:(From 1 to 100000)
	*    Time period for building the Fast-K line
	*
	* optInSlowK_Period:(From 1 to 100000)
	*    Smoothing for making the Slow-K line. Usually set to 3
	*
	* optInSlowK_MAType:
	*    Type of Moving Average for Slow-K
	*
	* optInSlowD_Period:(From 1 to 100000)
	*    Smoothing for making the Slow-D line
	*
	* optInSlowD_MAType:
	*    Type of Moving Average for Slow-D
	*
	*
	*/
	TA_STOCH          :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, optInFastK_Period: i32, optInSlowK_Period: i32, optInSlowK_MAType: TA_MAType, optInSlowD_Period: i32, optInSlowD_MAType: TA_MAType, outBegIdx: ^i32, outNBElement: ^i32, outSlowK: [^]f64, outSlowD: [^]f64) -> TA_RetCode ---
	TA_S_STOCH        :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, optInFastK_Period: i32, optInSlowK_Period: i32, optInSlowK_MAType: TA_MAType, optInSlowD_Period: i32, optInSlowD_MAType: TA_MAType, outBegIdx: ^i32, outNBElement: ^i32, outSlowK: [^]f64, outSlowD: [^]f64) -> TA_RetCode ---
	TA_STOCH_Lookback :: proc(optInFastK_Period: i32, optInSlowK_Period: i32, optInSlowK_MAType: TA_MAType, optInSlowD_Period: i32, optInSlowD_MAType: TA_MAType) -> i32 ---

	/*
	* TA_STOCHF - Stochastic Fast
	*
	* Input  = High, Low, Close
	* Output = double, double
	*
	* Optional Parameters
	* -------------------
	* optInFastK_Period:(From 1 to 100000)
	*    Time period for building the Fast-K line
	*
	* optInFastD_Period:(From 1 to 100000)
	*    Smoothing for making the Fast-D line. Usually set to 3
	*
	* optInFastD_MAType:
	*    Type of Moving Average for Fast-D
	*
	*
	*/
	TA_STOCHF          :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, optInFastK_Period: i32, optInFastD_Period: i32, optInFastD_MAType: TA_MAType, outBegIdx: ^i32, outNBElement: ^i32, outFastK: [^]f64, outFastD: [^]f64) -> TA_RetCode ---
	TA_S_STOCHF        :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, optInFastK_Period: i32, optInFastD_Period: i32, optInFastD_MAType: TA_MAType, outBegIdx: ^i32, outNBElement: ^i32, outFastK: [^]f64, outFastD: [^]f64) -> TA_RetCode ---
	TA_STOCHF_Lookback :: proc(optInFastK_Period: i32, optInFastD_Period: i32, optInFastD_MAType: TA_MAType) -> i32 ---

	/*
	* TA_STOCHRSI - Stochastic Relative Strength Index
	*
	* Input  = double
	* Output = double, double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 2 to 100000)
	*    Number of period
	*
	* optInFastK_Period:(From 1 to 100000)
	*    Time period for building the Fast-K line
	*
	* optInFastD_Period:(From 1 to 100000)
	*    Smoothing for making the Fast-D line. Usually set to 3
	*
	* optInFastD_MAType:
	*    Type of Moving Average for Fast-D
	*
	*
	*/
	TA_STOCHRSI          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, optInFastK_Period: i32, optInFastD_Period: i32, optInFastD_MAType: TA_MAType, outBegIdx: ^i32, outNBElement: ^i32, outFastK: [^]f64, outFastD: [^]f64) -> TA_RetCode ---
	TA_S_STOCHRSI        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, optInFastK_Period: i32, optInFastD_Period: i32, optInFastD_MAType: TA_MAType, outBegIdx: ^i32, outNBElement: ^i32, outFastK: [^]f64, outFastD: [^]f64) -> TA_RetCode ---
	TA_STOCHRSI_Lookback :: proc(optInTimePeriod: i32, optInFastK_Period: i32, optInFastD_Period: i32, optInFastD_MAType: TA_MAType) -> i32 ---

	/*
	* TA_SUB - Vector Arithmetic Subtraction
	*
	* Input  = double, double
	* Output = double
	*
	*/
	TA_SUB          :: proc(startIdx: i32, endIdx: i32, inReal0: [^]f64, inReal1: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_SUB        :: proc(startIdx: i32, endIdx: i32, inReal0: [^]f32, inReal1: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_SUB_Lookback :: proc() -> i32 ---

	/*
	* TA_SUM - Summation
	*
	* Input  = double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 2 to 100000)
	*    Number of period
	*
	*
	*/
	TA_SUM          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_SUM        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_SUM_Lookback :: proc(optInTimePeriod: i32 /* From 2 to 100000 */) -> i32 --- /* From 2 to 100000 */

	/*
	* TA_T3 - Triple Exponential Moving Average (T3)
	*
	* Input  = double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 1 to 100000)
	*    Number of period
	*
	* optInVFactor:(From 0 to 1)
	*    Volume Factor
	*
	*
	*/
	TA_T3          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, optInVFactor: f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_T3        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, optInVFactor: f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_T3_Lookback :: proc(optInTimePeriod: i32, optInVFactor: f64 /* From 0 to 1 */) -> i32 --- /* From 0 to 1 */

	/*
	* TA_TAN - Vector Trigonometric Tan
	*
	* Input  = double
	* Output = double
	*
	*/
	TA_TAN          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_TAN        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_TAN_Lookback :: proc() -> i32 ---

	/*
	* TA_TANH - Vector Trigonometric Tanh
	*
	* Input  = double
	* Output = double
	*
	*/
	TA_TANH          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_TANH        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_TANH_Lookback :: proc() -> i32 ---

	/*
	* TA_TEMA - Triple Exponential Moving Average
	*
	* Input  = double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 1 to 100000)
	*    Number of period
	*
	*
	*/
	TA_TEMA          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_TEMA        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_TEMA_Lookback :: proc(optInTimePeriod: i32 /* From 1 to 100000 */) -> i32 --- /* From 1 to 100000 */

	/*
	* TA_TRANGE - True Range
	*
	* Input  = High, Low, Close
	* Output = double
	*
	*/
	TA_TRANGE          :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_TRANGE        :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_TRANGE_Lookback :: proc() -> i32 ---

	/*
	* TA_TRIMA - Triangular Moving Average
	*
	* Input  = double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 1 to 100000)
	*    Number of period
	*
	*
	*/
	TA_TRIMA          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_TRIMA        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_TRIMA_Lookback :: proc(optInTimePeriod: i32 /* From 1 to 100000 */) -> i32 --- /* From 1 to 100000 */

	/*
	* TA_TRIX - 1-day Rate-Of-Change (ROC) of a Triple Smooth EMA
	*
	* Input  = double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 1 to 100000)
	*    Number of period
	*
	*
	*/
	TA_TRIX          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_TRIX        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_TRIX_Lookback :: proc(optInTimePeriod: i32 /* From 1 to 100000 */) -> i32 --- /* From 1 to 100000 */

	/*
	* TA_TSF - Time Series Forecast
	*
	* Input  = double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 2 to 100000)
	*    Number of period
	*
	*
	*/
	TA_TSF          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_TSF        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_TSF_Lookback :: proc(optInTimePeriod: i32 /* From 2 to 100000 */) -> i32 --- /* From 2 to 100000 */

	/*
	* TA_TYPPRICE - Typical Price
	*
	* Input  = High, Low, Close
	* Output = double
	*
	*/
	TA_TYPPRICE          :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_TYPPRICE        :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_TYPPRICE_Lookback :: proc() -> i32 ---

	/*
	* TA_ULTOSC - Ultimate Oscillator
	*
	* Input  = High, Low, Close
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod1:(From 1 to 100000)
	*    Number of bars for 1st period.
	*
	* optInTimePeriod2:(From 1 to 100000)
	*    Number of bars fro 2nd period
	*
	* optInTimePeriod3:(From 1 to 100000)
	*    Number of bars for 3rd period
	*
	*
	*/
	TA_ULTOSC          :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, optInTimePeriod1: i32, optInTimePeriod2: i32, optInTimePeriod3: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_ULTOSC        :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, optInTimePeriod1: i32, optInTimePeriod2: i32, optInTimePeriod3: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_ULTOSC_Lookback :: proc(optInTimePeriod1: i32, optInTimePeriod2: i32, optInTimePeriod3: i32 /* From 1 to 100000 */) -> i32 --- /* From 1 to 100000 */

	/*
	* TA_VAR - Variance
	*
	* Input  = double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 1 to 100000)
	*    Number of period
	*
	* optInNbDev:(From TA_REAL_MIN to TA_REAL_MAX)
	*    Nb of deviations
	*
	*
	*/
	TA_VAR          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, optInNbDev: f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_VAR        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, optInNbDev: f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_VAR_Lookback :: proc(optInTimePeriod: i32, optInNbDev: f64 /* From TA_REAL_MIN to TA_REAL_MAX */) -> i32 --- /* From TA_REAL_MIN to TA_REAL_MAX */

	/*
	* TA_WCLPRICE - Weighted Close Price
	*
	* Input  = High, Low, Close
	* Output = double
	*
	*/
	TA_WCLPRICE          :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_WCLPRICE        :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_WCLPRICE_Lookback :: proc() -> i32 ---

	/*
	* TA_WILLR - Williams' %R
	*
	* Input  = High, Low, Close
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 2 to 100000)
	*    Number of period
	*
	*
	*/
	TA_WILLR          :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f64, inLow: [^]f64, inClose: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_WILLR        :: proc(startIdx: i32, endIdx: i32, inHigh: [^]f32, inLow: [^]f32, inClose: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_WILLR_Lookback :: proc(optInTimePeriod: i32 /* From 2 to 100000 */) -> i32 --- /* From 2 to 100000 */

	/*
	* TA_WMA - Weighted Moving Average
	*
	* Input  = double
	* Output = double
	*
	* Optional Parameters
	* -------------------
	* optInTimePeriod:(From 1 to 100000)
	*    Number of period
	*
	*
	*/
	TA_WMA          :: proc(startIdx: i32, endIdx: i32, inReal: [^]f64, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_S_WMA        :: proc(startIdx: i32, endIdx: i32, inReal: [^]f32, optInTimePeriod: i32, outBegIdx: ^i32, outNBElement: ^i32, outReal: [^]f64) -> TA_RetCode ---
	TA_WMA_Lookback :: proc(optInTimePeriod: i32 /* From 1 to 100000 */) -> i32 --- /* From 1 to 100000 */

	/* Some TA functions takes a certain amount of input data
	* before stabilizing and outputing meaningful data. This is
	* a behavior pertaining to the algo of some TA functions and
	* is not particular to the TA-Lib implementation.
	* TA-Lib allows you to automatically strip off these unstabl
	* data from your output and from any internal processing.
	* (See documentation for more info)
	*
	* Examples:
	*      TA_SetUnstablePeriod( TA_FUNC_UNST_EMA, 30 );
	*           Always strip off 30 price bar for the TA_EMA function.
	*
	*      TA_SetUnstablePeriod( TA_FUNC_UNST_ALL, 30 );
	*           Always strip off 30 price bar from ALL functions
	*           having an unstable period.
	*
	* See ta_defs.h for the enumeration TA_FuncUnstId
	*/
	TA_SetUnstablePeriod :: proc(id: TA_FuncUnstId, unstablePeriod: u32) -> TA_RetCode ---
	TA_GetUnstablePeriod :: proc(id: TA_FuncUnstId) -> u32 ---

	/* You can change slightly the behavior of the TA functions
	* by requesting compatibiliy with some existing software.
	*
	* By default, the behavior is as close as the original
	* author of the TA functions intend it to be.
	*
	* See ta_defs.h for the enumeration TA_Compatibility.
	*/
	TA_SetCompatibility :: proc(value: TA_Compatibility) -> TA_RetCode ---
	TA_GetCompatibility :: proc() -> TA_Compatibility ---

	/* Call TA_SetCandleSettings to set that when comparing a candle
	* basing on settingType it must be compared with the average
	* of the last avgPeriod candles' rangeType multiplied by factor.
	* This setting is valid until TA_RestoreCandleDefaultSettings is called
	*/
	TA_SetCandleSettings :: proc(settingType: TA_CandleSettingType, rangeType: TA_RangeType, avgPeriod: i32, factor: f64) -> TA_RetCode ---

	/* Call TA_RestoreCandleDefaultSettings after using custom settings
	* to restore the default settings for the specified settingType
	*/
	TA_RestoreCandleDefaultSettings :: proc(settingType: TA_CandleSettingType) -> TA_RetCode ---
}

