//
//  CalendarEnums.swift
//
//  Copyright (c) 2016-2020 JTAppleCalendar (https://github.com/patchthecode/JTAppleCalendar)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

/// Describes a scroll destination
public enum SegmentDestination {
    /// next the destination is the following segment
    case next
    /// previous the destination is the previous segment
    case previous
    /// start the destination is the start segment
    case start
    /// end the destination is the end segment
    case end
}
/// Describes the types of out-date cells to be generated.
public enum OutDateCellGeneration {
    /// tillEndOfRow will generate dates till it reaches the end of a row.
    /// endOfGrid will continue generating until it has filled a 6x7 grid.
    /// Off-mode will generate no postdates
    case tillEndOfRow, tillEndOfGrid, off
}

/// Describes the types of out-date cells to be generated.
public enum InDateCellGeneration {
    /// forFirstMonthOnly will generate dates for the first month only
    /// forAllMonths will generate dates for all months
    /// off setting will generate no dates
    case forFirstMonthOnly, forAllMonths, off, tillEndOfRow
}

/// Describes the calendar reading direction
/// Useful for regions that read text from right to left
public enum ReadingOrientation {
    /// Reading orientation is from right to left
    case rightToLeft
    /// Reading orientation is from left to right
    case leftToRight
}

/// Configures the behavior of the scrolling mode of the calendar
public enum ScrollingMode: Equatable {
    /// stopAtEachCalendarFrame - non-continuous scrolling that will stop at each frame
    case stopAtEachCalendarFrame
    /// stopAtEachSection - non-continuous scrolling that will stop at each section
    case stopAtEachSection
    /// stopAtEach - non-continuous scrolling that will stop at each custom interval
    case stopAtEach(customInterval: CGFloat)
    /// nonStopToSection - continuous scrolling that will stop at a section
    case nonStopToSection(withResistance: CGFloat)
    /// nonStopToCell - continuous scrolling that will stop at a cell
    case nonStopToCell(withResistance: CGFloat)
    /// nonStopTo - continuous scrolling that will stop at acustom interval, do not use 0 as custom interval
    case nonStopTo(customInterval: CGFloat, withResistance: CGFloat)
    /// none - continuous scrolling that will eventually stop at a point
    case none
    
    func pagingIsEnabled() -> Bool {
        switch self {
        case .stopAtEachCalendarFrame: return true
        default: return false
        }
    }
    
    public static func ==(lhs: ScrollingMode, rhs: ScrollingMode) -> Bool {
        switch (lhs, rhs) {
        case (.none, .none),
             (.stopAtEachCalendarFrame, .stopAtEachCalendarFrame),
             (.stopAtEachSection, .stopAtEachSection): return true
        case (let .stopAtEach(customInterval: v1), let .stopAtEach(customInterval: v2)): return v1 == v2
        case (let .nonStopToSection(withResistance: v1), let .nonStopToSection(withResistance: v2)): return v1 == v2
        case (let .nonStopToCell(withResistance: v1), let .nonStopToCell(withResistance: v2)): return v1 == v2
        case (let .nonStopTo(customInterval: v1, withResistance: x1), let .nonStopTo(customInterval: v2, withResistance: x2)): return v1 == v2 && x1 == x2
        default: return false
        }
    }
}

/// Describes which month owns the date
public enum DateOwner: Int {
    /// Describes which month owns the date
    case thisMonth = 0,
        previousMonthWithinBoundary,
        previousMonthOutsideBoundary,
        followingMonthWithinBoundary,
        followingMonthOutsideBoundary
}
/// Months of the year
public enum MonthsOfYear: Int, CaseIterable {
    case jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec
}

/// Selection position of a range-selected date cell
public enum SelectionRangePosition: Int {
    /// Selection position
    case left = 1, middle, right, full, none
}

/// Between month segments, the range selection can either be visually disconnected or connected
public enum RangeSelectionMode {
  case segmented, continuous
}

/// Signifies whether or not a selection was done programatically or by the user
public enum SelectionType: String {
    /// Selection type
    case programatic, userInitiated
}

/// Days of the week. By setting your calendar's first day of the week,
/// you can change which day is the first for the week. Sunday is the default value.
public enum DaysOfWeek: Int, CaseIterable {
    /// Days of the week.
    case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday
}

internal enum DelayedTaskType {
    case scroll, general
}

internal enum SelectionAction {
    case didSelect, didDeselect
}

internal enum ShouldSelectionAction {
    case shouldSelect, shouldDeselect
}
