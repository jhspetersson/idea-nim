package nim;

import com.intellij.lexer.FlexLexer;
import com.intellij.psi.tree.IElementType;
import nim.psi.NimTypes;
import static nim.psi.NimTypes.*;
import com.intellij.psi.TokenType;

%%

%class NimLexer
%implements FlexLexer
%unicode
%function advance
%type IElementType
%eof{  return;
%eof}

CRLF=\n|\r|\r\n
WHITE_SPACE=[\ \t\f]
END_OF_LINE_COMMENT="#"[^\r\n]*
KEYWORD="echo"
T_VAR="var"
T_LET="let"
T_CONST="const"
T_PROC="proc"
T_IMPORT="import"
T_ELIF="elif"
T_IF="if"
T_ELSE="else"
STRING=\"([^\"\\]|\\\\|\\\"|\\n)*\"
NUMBER=[0-9]+(\.[0-9]+)?
IDENTIFIER=[a-zA-Z][a-zA-Z_0-9]*
TEMPLATE=\{\.[a-zA-Z][a-zA-Z_0-9]*\.\}
OP_ASSIGN="="
COLON=":"
COMMA=","
OPEN_BRACKET="("
CLOSE_BRACKET=")"

%state YYINITIAL

%%

<YYINITIAL> {
    {END_OF_LINE_COMMENT} { return NimTypes.COMMENT; }
    {TEMPLATE}            { return NimTypes.COMMENT; }
    {KEYWORD}             { return NimTypes.KEYWORD; }
    {CRLF}+               { return TokenType.WHITE_SPACE; }
    {WHITE_SPACE}+        { return TokenType.WHITE_SPACE; }
    {T_IMPORT}            { return NimTypes.T_IMPORT; }
    {T_VAR}               { return NimTypes.T_VAR; }
    {T_LET}               { return NimTypes.T_LET; }
    {T_CONST}             { return NimTypes.T_CONST; }
    {T_PROC}              { return NimTypes.T_PROC; }
    {T_ELIF}              { return NimTypes.T_ELIF; }
    {T_IF}                { return NimTypes.T_IF; }
    {T_ELSE}              { return NimTypes.T_ELSE; }
    {STRING}              { return NimTypes.STRING; }
    {NUMBER}              { return NimTypes.NUMBER; }
    {IDENTIFIER}          { return NimTypes.IDENTIFIER; }
    {OP_ASSIGN}           { return NimTypes.OP_ASSIGN; }
    {COLON}               { return NimTypes.COLON; }
    {COMMA}               { return NimTypes.COMMA; }
    {OPEN_BRACKET}        { return NimTypes.OPEN_BRACKET; }
    {CLOSE_BRACKET}       { return NimTypes.CLOSE_BRACKET; }
    "+"                   { return OP_PLUS; }
    "-"                   { return OP_MINUS; }
    "*"                   { return OP_MULTIPLY; }
    "/"                   { return OP_DIVIDE; }
    "=="                  { return OP_EQ; }
    "!="                  { return OP_NE; }
    "<"                   { return OP_LT; }
    "<="                  { return OP_LE; }
    ">"                   { return OP_GT; }
    ">="                  { return OP_GE; }


    "when"                { return T_WHEN; }
    "while"               { return T_WHILE; }
    "case"                { return T_CASE; }
    "for"                 { return T_FOR; }
    "let"                 { return T_LET; }
    "const"               { return T_CONST; }
    "block"               { return T_BLOCK; }
    "try"                 { return T_TRY; }
    "except"              { return T_EXCEPT; }
    "finally"             { return T_FINALLY; }
    "include"             { return T_INCLUDE; }
    "mixin"               { return T_MIXIN; }
    "discard"             { return T_DISCARD; }
    .                     { return TokenType.WHITE_SPACE; }
}

