FROM python:3.8-slim
COPY src/ /app-root
RUN groupadd doccano \ 
&& useradd -m -d /home/doccano -g doccano doccano \
&& chown -R doccano:doccano /app-root \
&& chmod +x /app-root/* \
&& ls -lha 
WORKDIR /app-root 
USER doccano
RUN python3 -m pip install -r requirements.txt 
ENV PATH="/home/doccano/.local/bin:$PATH"
ENTRYPOINT [ "/bin/sh", "-c", "/app-root/app.sh" ]