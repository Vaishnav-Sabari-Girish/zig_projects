//! By convention, root.zig is the root source file when making a package.
const std = @import("std");
const Io = std.Io;


pub fn add(a: i32, b: i32) i32 {
    return a + b;
}

pub fn sub(a: i32, b: i32) i32 {
    return a - b;
}

pub fn prod(a: i32, b: i32) i32 {
    return a * b;
}

pub fn quo(a: f32, b: f32) f32 {
    return a / b;
}

pub fn rem(a: u32, b: u32) u32 {
    return a % b;
}

pub fn calc(input: []const u8) !i64 {
    var i: usize = 0;
    var result: i64 = 0;
    var pending_op: u8 = '+';

    while (i < input.len) {
        while (i < input.len and input[i] == ' ') : (i += 1) {}
        if (i >= input.len) break;

        const start = i;
        while (i < input.len and std.ascii.isDigit(input[i])) : (i += 1) {}
        if (i == start) return error.NoOperatorFound;

        const num = try std.fmt.parseInt(i64, input[start..i], 10);

        result = switch (pending_op) {
            '+' => result + num,
            '-' => result - num,
            '*' => result * num,
            '/' => if (num == 0) return error.DivisionByZero else @divTrunc(result, num),
            '%' => if (num == 0) return error.DivisionByZero else @rem(result, num),
            else => unreachable,
        };

        while (i < input.len and input[i] == ' ') : (i += 1) {}
        if (i >= input.len) break;

        switch (input[i]) {
            '+', '-', '*', '/', '%' => {
                pending_op = input[i];
                i += 1;
            },
            else => return error.UnexpectedCharacter,
        }
    }

    return result;
}


test "basic calculator functionalities" {
    try std.testing.expect(add(3, 7) == 10);
    try std.testing.expect(sub(7, 3) == 4);
    try std.testing.expect(prod(7, 3) == 21);
    try std.testing.expect(quo(8.0, 2.0) == 4.0);
    try std.testing.expect(rem(10, 6) == 4);
}

test "User input calculator" {
    const res = try calc("2 + 3 - 4 * 5 / 6 % 7");
    try std.testing.expect(res == 0);
}
