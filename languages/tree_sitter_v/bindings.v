module tree_sitter_v

import v_tree_sitter.tree_sitter

#flag -I @VMODROOT/src
#flag @VMODROOT/src/scanner.o
#flag @VMODROOT/src/parser.o

#include "@VMODROOT/src/bindings.h"

fn C.tree_sitter_v() &tree_sitter.TSLanguage

pub const language = unsafe { C.tree_sitter_v() }
