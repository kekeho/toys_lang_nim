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
        integerLiteral,
        identifierType,
        assignmentType
    Expression* = ref ExpressionObj
    ExpressionObj = object
        case expressionKind*: ExpressionType
        of binaryExpression:
            operator*: Operator
            lhs*: Expression
            rhs*: Expression
        of integerLiteral:
            value*: int
        of identifierType:
            identifierName*: string
        of assignmentType:
            assignmentName*: string
            expression*: Expression


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

func identifier*(name: string): Expression =
    return Expression(expressionKind: identifierType, identifierName: name)

func assignment*(name: string, expression: Expression): Expression =
    return Expression(expressionKind: assignmentType, assignmentName: name, expression: expression)