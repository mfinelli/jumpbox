FROM archlinux

COPY ./dashbinsh.hook /usr/share/libalpm/hooks/dashbinsh.hook

RUN \
  pacman -Syu --noconfirm \
    bind \
    dash \
    git \
    inetutils \
    postgresql \
    redis \
    traceroute && \
  pacman -Scc --noconfirm

COPY ./keepalive.sh /keepalive.sh
CMD ["/keepalive.sh"]
