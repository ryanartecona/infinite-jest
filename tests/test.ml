open Unit
open Unit.Test

let assertions =
  describe "Assertions" (fun () -> [
    test "stringContaining" (fun () ->
      "banana" |> Expect.stringContaining "na");
    test "stringContaining - fail" (fun () ->
      "banana" |> Expect.stringContaining "bna");
    test "toBeCloseTo - default" (fun () ->
      3.14159 |> Expect.toBeCloseTo 3.144);
    test "toBeCloseTo - default - fail" (fun () ->
      3.14159 |> Expect.toBeCloseTo 3.15);
    test "toBeCloseTo - digits" (fun () ->
      3.14159 |> Expect.toBeCloseTo ~digits:3 3.142);
    test "toBeCloseTo - digits - fail" (fun () ->
      3.14159 |> Expect.toBeCloseTo ~digits:3 3.141);
    test "toBeFalse" (fun () ->
      false |> Expect.toBeFalse);
    test "toBeFalse - fail" (fun () ->
      true |> Expect.toBeFalse);
    test "toBeGreaterThan" (fun () ->
      3 |> Expect.toBeGreaterThan 2);
    test "toBeGreaterThan - fail" (fun () ->
      3 |> Expect.toBeGreaterThan 3);
    test "toBeLessThan" (fun () ->
      2 |> Expect.toBeLessThan 3);
    test "toBeLessThan - fail" (fun () ->
      2 |> Expect.toBeLessThan 2);
    test "toBeTrue" (fun () ->
      true |> Expect.toBeTrue);
    test "toBeTrue - fail" (fun () ->
      false |> Expect.toBeTrue);
    test "toContain" (fun () ->
      [1; 2; 3] |> Expect.toContain 2);
    test "toContain - fail" (fun () ->
      [1; 2; 3] |> Expect.toContain 4);
    test "toContainAll" (fun () ->
      [1; 2; 3] |> Expect.toContainAll [2; 3]);
    test "toContainAll - fail" (fun () ->
      [1; 2; 3] |> Expect.toContainAll [2; 4]);
    test "toEqual" (fun () ->
      `Foo |> Expect.toEqual `Foo);
    test "toEqual - fail" (fun () ->
      `Foo |> Expect.toEqual `Bar);
    test "toRaise" (fun () ->
      (fun () -> assert false) |> Expect.toRaise);
    test "toRaise - fail" (fun () ->
      (fun () -> ()) |> Expect.toRaise);
  ])

let _ = 
  run [
    My_test.suite;
    assertions
  ]