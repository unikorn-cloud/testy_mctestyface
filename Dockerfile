FROM gcr.io/distroless/static:nonroot

COPY bin/entry /

ENTRYPOINT ["/entry"]
