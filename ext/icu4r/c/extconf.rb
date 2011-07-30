require 'mkmf'
$LDFLAGS = "-licuuc -licui18n -licudata -lstdc++ "
$CFLAGS = "-Wall"

create_makefile('icu4r')
File.open("Makefile", "a") << <<-EOT

check:	$(DLLIB)
	@$(RUBY) $(srcdir)/test/test_ustring.rb 
	@$(RUBY) $(srcdir)/test/test_calendar.rb
	@$(RUBY) $(srcdir)/test/test_converter.rb
	@$(RUBY) $(srcdir)/test/test_collator.rb

EOT
