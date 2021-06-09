all: doc

doc:
	$(MAKE) -C docs

install: doc
	install -m 755 sbin/*        $(DESTDIR)/usr/sbin/
	install -m 644 net-functions debian/grml-network/etc/grml/
	install -m 644 routersetup   debian/grml-network/etc/grml/
	$(MAKE) -C docs install

.PHONY: doc install
