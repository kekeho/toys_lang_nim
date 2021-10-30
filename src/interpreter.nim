import ast
import tables

type Environment = Table[string, int]


func interpret(environment: var Environment, expression: ast.Expression): int =
    case expression.expressionKind
    of ast.ExpressionType.binaryExpression:
        let lhs = interpret(environment, expression.lhs)
        let rhs = interpret(environment, expression.rhs)
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

    of ast.ExpressionType.identifierType:
        # 変数の参照
        return environment[expression.identifierName]
    of ast.ExpressionType.assignmentType:
        # 変数の代入
        let value: int = interpret(environment, expression.expression)
        environment[expression.assignmentName] = value
        return value # 代入も式?


func interpret*(expressions: seq[ast.Expression]): int =
    var 
        env: Environment
        answer: int
    for e in expressions:
        answer = interpret(env, e)
    
    return answer
