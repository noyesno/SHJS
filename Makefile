
lang/sh_asm.js : source-highlight-lang/asm.lang
	perl -I bin bin/sh2js.pl $< > lang/sh_asm.js

lang/sh_asm.min.js : lang/sh_asm.js
	curl  \
	  -d "compilation_level=SIMPLE_OPTIMIZATIONS" \
	  -d "output_info=compiled_code"  \
	  -d "output_format=text" \
	  --data-urlencode "js_code@$<" \
	  http://closure-compiler.appspot.com/compile \
	  > $@
	



