type Operator* = enum
    ADD = "+"
    SUBTRACT = "-"
    MULTIPLY = "*"
    DIVIDE = "/"


func getName*(op: Operator): string =
    return $op


type
    ExpressionType* = enum
        binaryExpression,
        integerLiteral
    Expression* = ref ExpressionObj
    ExpressionObj = object
        case expressionKind*: ExpressionType
        of binaryExpression:
            operator*: Operator
            lhs*: Expression
            rhs*: Expression
        of integerLiteral:
            value*: int


func add*(lhs: Expression, rhs: Expression): Expression =
    return Expression(expressionKind: binaryExpression, operator: ADD, lhs: lhs, rhs: rhs)

func subtract*(lhs: Expression, rhs: Expression): Expression =
    return Expression(expressionKind: binaryExpression, operator: SUBTRACT, lhs: lhs, rhs: rhs)

func multiply*(lhs: Expression, rhs: Expression): Expression =
    return Expression(expressionKind: binaryExpression, operator: MULTIPLY, lhs: lhs, rhs: rhs)

func divide*(lhs: Expression, rhs: Expression): Expression =
    return Expression(expressionKind: binaryExpression, operator: DIVIDE, lhs: lhs, rhs: rhs)

func integer*(value: int): Expression =
    return Expression(expressionKind: integerLiteral, value: value)
