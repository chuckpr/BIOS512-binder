FROM jupyter/r-notebook:lab-3.1.6

RUN mamba install -y \
    jupyter-offlinenotebook=0.2.1 \
    nbgitpuller=0.10.2 \
  && fix-permissions "${CONDA_DIR}" \
  && fix-permissions "/home/${NB_USER}" \
  && mamba clean --all -y
