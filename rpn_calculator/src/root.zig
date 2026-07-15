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


test "basic calculator functionalities" {
    try std.testing.expect(add(3, 7) == 10);
    try std.testing.expect(sub(7, 3) == 4);
    try std.testing.expect(prod(7, 3) == 21);
    try std.testing.expect(quo(8.0, 2.0) == 4.0);
    try std.testing.expect(rem(10, 6) == 4);
}
