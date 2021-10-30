import ast

func interpret*(expression: ast.Expression): int =
    case expression.expressionKind
    of ast.ExpressionType.binaryExpression:
        let lhs = interpret(expression.lhs)
        let rhs = interpret(expression.rhs)
        return case expression.operator
        of ast.Operator.ADD:
            lhs + rhs
        of ast.Operator.SUBTRACT:
            lhs - rhs
        of ast.Operator.MULTIPLY:
            lhs * rhs
        of ast.Operator.DIVIDE:
            int(lhs / rhs)
    of ast.ExpressionType.integerLiteral:
        return expression.value
