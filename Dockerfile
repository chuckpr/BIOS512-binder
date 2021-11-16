FROM jupyter/r-notebook:lab-3.1.6

RUN mamba install -y \
    jupyter-offlinenotebook=0.2.1 \
    nbgitpuller=0.10.2 \
    r-palmerpenguins \
    r-patchwork \
    r-ggrepel \
    r-ggforce \
  && fix-permissions "${CONDA_DIR}" \
  && fix-permissions "/home/${NB_USER}" \
  && mamba clean --all -y \
  && jupyter serverextension enable nbgitpuller --sys-prefix

COPY .Rprofile /home/${NB_USER}/
