const std = @import("std");

const rpn_calculator = @import("rpn_calculator");

pub fn main(init: std.process.Init) !void {
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

    const io = init.io;
    const allocator = init.arena.allocator();

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.Io.File.stdin().reader(io, &stdin_buffer);
    const stdin: *std.Io.Reader = &stdin_reader.interface;


    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.Io.File.stdout().writer(io, &stdout_buffer);
    const stdout: *std.Io.Writer = &stdout_writer.interface;

    try stdout.writeAll("Calculator: ");
    try stdout.flush();

    const bare_line = try stdin.takeDelimiterExclusive('\n');
    const line = std.mem.trim(u8, bare_line, "\r");


    const res = rpn_calculator.calc(line) catch |err| {
        try stdout.print("Error: {s}\n", .{@errorName(err)});
        try stdout.flush();
        return;
    };

    _ = allocator;

    std.debug.print("Calculator Output: {d}\n", .{res});
}

