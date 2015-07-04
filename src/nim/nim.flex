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
T_SEQ="seq"
T_PROC="proc"
T_IMPORT="import"
T_ELIF="elif"
T_IF="if"
T_ELSE="else"
T_FOR="for"
T_IN="in"
T_WHILE="while"
T_BLOCK="block"
T_DISCARD="discard"
T_RETURN="return"
STRING=\"([^\"\\]|\\\\|\\\"|\\n|\\t)*\"
CHAR='.'
NUMBER=[0-9]+(\.[0-9]+)?
IDENTIFIER=[a-zA-Z][a-zA-Z_0-9]*
OPERATOR_IDENTIFIER=`[\=\+\-\*\/\<\>\@\$\~\&\%\|\!\?\^\.\:\\]+`
CUSTOM_OPERATOR=[\=\+\-\*\/\<\>\@\$\~\&\%\|\!\?\^\.\:\\]+
NIL="nil"
TEMPLATE=\{\.[a-zA-Z][a-zA-Z_0-9]*\.\}
OP_ASSIGN="="
OP_MOD="mod"
COLON=":"
COMMA=","
T_RANGE=".."
T_DOT="."
OPEN_BRACKET="("
CLOSE_BRACKET=")"
OPEN_SBRACKET="["
CLOSE_SBRACKET="]"

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
    {T_SEQ}               { return NimTypes.T_SEQ; }
    {T_PROC}              { return NimTypes.T_PROC; }
    {T_ELIF}              { return NimTypes.T_ELIF; }
    {T_IF}                { return NimTypes.T_IF; }
    {T_ELSE}              { return NimTypes.T_ELSE; }
    {T_FOR}               { return NimTypes.T_FOR; }
    {T_IN}                { return NimTypes.T_IN; }
    {T_WHILE}             { return NimTypes.T_WHILE; }
    "true"                { return NimTypes.T_TRUE; }
    "false"               { return NimTypes.T_FALSE; }
    "case"                { return NimTypes.T_CASE; }
    "of"                  { return NimTypes.T_OF; }
    "break"               { return NimTypes.T_BREAK; }
    {T_BLOCK}             { return NimTypes.T_BLOCK; }
    {T_DISCARD}           { return NimTypes.T_DISCARD; }
    {STRING}              { return NimTypes.STRING; }
    {CHAR}                { return NimTypes.CHAR; }
    {NUMBER}              { return NimTypes.NUMBER; }
    {T_RANGE}             { return NimTypes.T_RANGE; }
    {T_DOT}               { return NimTypes.T_DOT; }
    "&&"                  { return NimTypes.OP_LOGICAL_AND; }
    "||"                  { return NimTypes.OP_LOGICAL_OR; }
    {OP_MOD}              { return NimTypes.OP_MOD; }
    "&"                   { return NimTypes.OP_AND; }
    "and"                 { return NimTypes.OP_AND_FULL; }
    "|"                   { return NimTypes.OP_OR; }
    "or"                  { return NimTypes.OP_OR_FULL; }
    "^"                   { return NimTypes.OP_XOR; }
    "xor"                 { return NimTypes.OP_XOR_FULL; }
    {NIL}                 { return NimTypes.NIL; }
    {T_RETURN}            { return NimTypes.T_RETURN; }
    {OPERATOR_IDENTIFIER} { return NimTypes.OPERATOR_IDENTIFIER; }
    {IDENTIFIER}          { return NimTypes.IDENTIFIER; }
    {OP_ASSIGN}           { return NimTypes.OP_ASSIGN; }
    {COLON}               { return NimTypes.COLON; }
    {COMMA}               { return NimTypes.COMMA; }
    {OPEN_BRACKET}        { return NimTypes.OPEN_BRACKET; }
    {CLOSE_BRACKET}       { return NimTypes.CLOSE_BRACKET; }
    {OPEN_SBRACKET}       { return NimTypes.OPEN_SBRACKET; }
    {CLOSE_SBRACKET}      { return NimTypes.CLOSE_SBRACKET; }
    "=="                  { return OP_EQ; }
    "!="                  { return OP_NE; }
    "<"                   { return OP_LT; }
    "<="                  { return OP_LE; }
    ">"                   { return OP_GT; }
    ">="                  { return OP_GE; }
    "+"                   { return OP_PLUS; }
    "-"                   { return OP_MINUS; }
    "*"                   { return OP_MULTIPLY; }
    "/"                   { return OP_DIVIDE; }
    "$"                   { return NimTypes.OP_STRINGIFY; }
    {CUSTOM_OPERATOR}     { return NimTypes.CUSTOM_OPERATOR; }

    "when"                { return T_WHEN; }
    "try"                 { return T_TRY; }
    "except"              { return T_EXCEPT; }
    "finally"             { return T_FINALLY; }
    "include"             { return T_INCLUDE; }
    "mixin"               { return T_MIXIN; }
    .                     { return TokenType.WHITE_SPACE; }
}

