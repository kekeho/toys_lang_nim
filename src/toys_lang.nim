import interpreter
import ast
import tables


when isMainModule:
  let exp: Expression = add(
    multiply(integer(10), integer(5)),
    integer(3)
  )
  echo interpret(exp)
