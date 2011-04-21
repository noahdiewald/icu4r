require 'mkmf'
$LDFLAGS = "-licuuc -licui18n -licudata -lstdc++ "
$CFLAGS = "-Wall"
if !have_library('icui18n', 'u_init_4_2')
  STDERR.puts "Tested against ICU v4.2, which is not the version you have."
end
create_makefile('icu4r')
File.open("Makefile", "a") << <<-EOT

check:	$(DLLIB)
	@$(RUBY) $(srcdir)/test/test_ustring.rb 
	@$(RUBY) $(srcdir)/test/test_calendar.rb
	@$(RUBY) $(srcdir)/test/test_converter.rb
	@$(RUBY) $(srcdir)/test/test_collator.rb

EOT
