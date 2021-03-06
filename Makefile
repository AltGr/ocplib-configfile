NAME=ocplib-configfile

all: $(NAME)

.PHONY: $(NAME)
$(NAME): ocp-build.root
	ocp-build $(NAME)

ocp-build.root:
	ocp-build -init -scan
	rm ocp-build.root.old

clean:
	ocp-build -clean

install: all
	ocamlfind install ocplib-configfile META \
	  _obuild/$(NAME)/*.cmi \
	  _obuild/$(NAME)/*.cmti \
	  _obuild/$(NAME)/*.cmt \
	  _obuild/$(NAME)/*.cma \
	  _obuild/$(NAME)/*.cmxa

uninstall:
	ocamlfind remove $(NAME)
