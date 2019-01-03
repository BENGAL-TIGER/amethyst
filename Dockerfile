# ψᵟ
#
#
# Based on base-notebook from Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
#
FROM marcucius/tiger_lab:quartz

LABEL maintainer="mdAshford"

USER root

ENV EXTMED_DIR=/opt/modelica/ExternalMedia

ADD ExternalMedia $EXTMED_DIR

# WORKDIR $EXTMED_DIR/Projects
RUN apt-get -y update && apt-get -y install cmake git g++ p7zip libpython-dev

# RUN mount d:/$EXTMED_DIR /ExternalMedia \
# RUN cd $EXTMED_DIR/Projects \
#  && ./BuildLib-OMC-gcc.sh \
#  && fix-permissions $EXTMED_DIR

# RUN cd $EXTMED_DIR/Projects \
#  && make -f makefile-linux -j40 \
#  && make -f makefile-linux install \
#  # && make install \
#  && cd "$EXTMED_DIR/Modelica/ExternalMedia 3.2.1/Resources/Library" \
#  && mv linux32 linux64 \
#  # && cd $EXTMED_DIR/Projects \
#  # && make -f makefile-linux install \
#  && fix-permissions $EXTMED_DIR

USER $NB_UID
