package nim.psi;

import com.intellij.psi.tree.IElementType;
import nim.lang.NimLanguage;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

public class NimElementType extends IElementType {
    public NimElementType(@NotNull @NonNls String debugName) {
        super(debugName, NimLanguage.INSTANCE);
    }
}
