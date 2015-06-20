package nim;

import com.intellij.lexer.FlexAdapter;

import java.io.Reader;

public class NimLexerAdapter extends FlexAdapter {
    public NimLexerAdapter() {
        super(new NimLexer((Reader) null));
    }
}
