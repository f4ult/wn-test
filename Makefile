WORKERS=3
BACKEND_HOSTS_FILE=proj/nginx/backend_hosts.conf
.PHONY: all install clean

all: $(BACKEND_HOSTS_FILE)

$(BACKEND_HOSTS_FILE):

	export WORKERS=$(WORKERS) BACKEND_HOSTS_FILE=$(BACKEND_HOSTS_FILE); misc/prepare.sh

	@echo
	@echo "Количество экземпляров контейнеров с приложением по умолчанию - "$(WORKERS)
	@echo "Вы можете указать другое количество, поменяв переменную WORKERS в Makefile, или из командной строки: "
	@echo "make clean && make install WORKERS=X"
	@echo "Для продолжения в конфигурации по-умолчанию введите: "
	@echo "make install  - для запуска процесса деплоя"
	@echo "make clean    - для остановки и удаления контейнеров на удаленном хосте. Также нужно применять перед"
	@echo "                изменением количества экземпляров масштабируемого контейнера"

install: $(BACKEND_HOSTS_FILE)
	ansible-playbook -i ansible-hosts ansible-playbook.yml --extra-vars "WORKERS=$(WORKERS)"

clean:
	if [ -f $(BACKEND_HOSTS_FILE) ] ; then \
	    rm $(BACKEND_HOSTS_FILE) ; \
	    ansible-playbook -i ansible-hosts ansible-clean.yml ; \
	fi
