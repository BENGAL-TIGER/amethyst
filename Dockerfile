# ψᵟ
#
#
# Based on base-notebook from Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
#
FROM marcucius/tiger_lab:quartz

LABEL maintainer="mdAshford"

USER root
# USER $NB_UID


ENV EXTMED_DIR="/opt/modelica/ExternalMedia 3.2.1"
ENV EXTMED_TEMP_DIR="/opt/modelica/temp"

RUN apt-get -y update && apt-get -y install cmake git g++ p7zip libpython-dev tree

# ADD ExternalMedia-master $EXTMED_TEMP_DIR/ExternalMedia
#
# RUN cd $EXTMED_TEMP_DIR/ExternalMedia/Projects \
# && make -f makefile-linux -j40 \
# && make -f makefile-linux install -j40





# ADD ExternalMedia-coolprop-slamer59-repo $EXTMED_TEMP_DIR/ExternalMedia
RUN 

RUN git clone --recursive https://github.com/BENGAL-TIGER/ExternalMedia "$EXTMED_TEMP_DIR/ExternalMedia"

RUN cd "$EXTMED_TEMP_DIR/ExternalMedia/Projects" \
 && chmod 755 BuildLib-CMake.sh \
 && bash BuildLib-CMake.sh


# RUN git clone -b v6.1.0 --single-branch --recursive https://github.com/CoolProp/CoolProp.git "$EXTMED_TEMP_DIR/ExternalMedia/externals/CoolProp.git"
# ADD CoolProp-6.1.0.sources "$EXTMED_TEMP_DIR/ExternalMedia/externals/CoolProp.git"

# ADD BuildLib-CMake.slamer.sh $EXTMED_TEMP_DIR/ExternalMedia/Projects/BuildLib-CMake.slamer.sh

# RUN cd $EXTMED_TEMP_DIR \
#  && git clone https://github.com/fmtlib/fmt.git \
#  && cd fmt \
#  && cmake CMakeLists.txt \
#  && make \
#  && make install
#
# #
# RUN cd $EXTMED_TEMP_DIR/ExternalMedia/Projects \
#  && chmod 755 BuildLib-CMake.slamer.sh \
# # && fix-permissions /opt/modelica \
#  && ./BuildLib-CMake.slamer.sh
#
# #
# RUN cd $EXTMED_TEMP_DIR/ExternalMedia/Projects \
#  && chmod 755 $EXTMED_TEMP_DIR/ExternalMedia/Projects/BuildLib-CMake.slamer.sh \
#  && ./BuildLib-CMake.slamer.sh \
#  && fix-permissions $EXTMED_TEMP_DIR


# WORKDIR $EXTMED_DIR/Projects





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
# USER root
