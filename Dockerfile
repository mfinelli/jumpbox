FROM archlinux

COPY ./dashbinsh.hook /usr/share/libalpm/hooks/dashbinsh.hook

RUN \
  pacman -Syu --noconfirm \
    bind \
    curl \
    dash \
    inetutils \
    postgresql \
    redis && \
  pacman -Scc --noconfirm

COPY ./keepalive.sh /keepalive.sh
CMD ["/keepalive.sh"]
