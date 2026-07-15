const std = @import("std");

const rpn_calculator = @import("rpn_calculator");

pub fn main() !void {
    const s = rpn_calculator.add(3, 7);
    const d = rpn_calculator.sub(7, 2);
    const p = rpn_calculator.prod(10, 2);
    const q = rpn_calculator.quo(10.0, 2.0);
    const r = rpn_calculator.rem(45, 8);

    std.debug.print("sum = {}\n", .{s});
    std.debug.print("difference = {}\n", .{d});
    std.debug.print("product = {}\n", .{p});
    std.debug.print("quotient = {}\n", .{q});
    std.debug.print("remainder = {}\n", .{r});
}

