import interpreter
import ast


when isMainModule:
  let expressions: seq[Expression] = @[
    assignment(
      "a",
      add(
        multiply(integer(10), integer(5)),
        integer(3)
      )
    ),  # a = 53
    assignment(
      "b",
      add(
        multiply(integer(90), integer(5)),
        integer(10)
      )
    ), # b = 460
    add(identifier("a"), identifier("b"))
  ]
  echo interpret(expressions)
