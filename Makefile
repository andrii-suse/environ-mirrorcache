SHELL=/bin/bash

install:
	install -d -m 0755 "${DESTDIR}"/usr/share/environ.d/mc
	install -m 0644 port_base.cnf "${DESTDIR}"/usr/share/environ.d/mc/port_base.cnf ;\
	install -d -m 0755 "${DESTDIR}"/usr/share/environ.d/mc/data
	install -m 0644 t/data/city.mmdb "${DESTDIR}"/usr/share/environ.d/mc/data/city.mmdb ;\
	for d in local source; do \
		test -d $$d || continue ;\
		mkdir -p "${DESTDIR}"/usr/share/environ.d/mc/$$d ;\
		for f in $$d/*.{m4,cnf} ; do \
			test -f $$f && install -m 0644 $$f "${DESTDIR}"/usr/share/environ.d/mc/$$f ;\
		done ;\
		for dd in $$d/* ; do \
			test -d $$dd || continue ;\
			for f in $$dd/*.m4 ; do \
				test -f $$f || continue ;\
				mkdir -p "${DESTDIR}"/usr/share/environ.d/mc/$$dd ;\
				install -m 0644 $$f "${DESTDIR}"/usr/share/environ.d/mc/$$f ;\
			done \
		done ;\
		for dd in $$d/* ; do \
			test -L $$dd || continue ;\
			l=$$(basename $$dd) ; \
			( cd "${DESTDIR}"/usr/share/environ.d/mc/$$d; ln -sf ../../$$l/local/ $$l ) ; \
		done \
	done
