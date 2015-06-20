package nim.lang;

import com.intellij.lang.Language;

public class NimLanguage extends Language {
    public static final NimLanguage INSTANCE = new NimLanguage();

    public NimLanguage() {
        super("Nim");
    }
}
