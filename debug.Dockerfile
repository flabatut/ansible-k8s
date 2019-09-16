ARG		BUILD_DATE
ARG		DOCKER_REPO
ARG		VCS_REF
ARG		DOCKER_TAG=latest
FROM	flabatut/ago:${VCS_REF}
COPY	requirements.pip.debug.txt .
RUN		apk --no-cache add bash==5.0.0-r0 \
			python3-dev=3.7.3-r0 \
			busybox-extras==1.30.1-r2 \
			vim==8.1.1365-r0 \
			make==4.2.1-r2 \
			gcc==8.3.0-r0 \
			musl-dev==1.1.22-r3 \
			libffi-dev==3.2.1-r6 \
			openssl-dev==1.1.1d-r0 \
		&& pip3 install -r requirements.pip.debug.txt
LABEL	name=${DOCKER_REPO} \
		version=${DOCKER_TAG} \
		org.label-schema.name=${DOCKER_REPO} \
		org.label-schema.build-date=${BUILD_DATE} \
		org.label-schema.vcs-url=${DOCKER_REPO} \
		org.label-schema.vcs-ref=${VCS_REF} \
		org.label-schema.schema-version=${DOCKER_TAG} \
		org.label-schema.version=${DOCKER_TAG}