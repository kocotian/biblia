
PREFIX = /usr/local

biblia: biblia.sh biblia.awk biblia.tsv
	cat biblia.sh > $@
	echo 'exit 0' >> $@
	echo "#EOF" >> $@
	tar cz biblia.awk biblia.tsv >> $@
	chmod +x $@

test: biblia.sh
	shellcheck -s sh biblia.sh

clean:
	rm -f biblia

install: biblia
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f biblia $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/biblia

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/biblia

.PHONY: test clean install uninstall
