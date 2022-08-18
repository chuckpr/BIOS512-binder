FROM jupyter/r-notebook:lab-3.4.5

RUN mamba install -y -c conda-forge \
    jupyter-offlinenotebook=0.2.1 \
    nbgitpuller=0.10.2 \
    r-palmerpenguins \
    r-patchwork \
    r-ggrepel \
    r-glmnet \
    r-ranger \
    r-ggforce \
    jupyterlab-tour \
    jupyterlab-link-share \
  && fix-permissions "${CONDA_DIR}" \
  && fix-permissions "/home/${NB_USER}" \
  && mamba clean --all -y \
  && jupyter serverextension enable nbgitpuller --sys-prefix

COPY .Rprofile /home/${NB_USER}/
