FROM jupyter/r-notebook:lab-3.1.18

RUN mamba install -y -c conda-forge \
    jupyter-offlinenotebook \
    nbgitpuller \
    r-palmerpenguins \
    r-patchwork \
    r-ggrepel \
    r-glmnet \
    r-ranger \
    r-ggforce \
    jupyterlab-tour \
    jupyterlab-link-share \
    retrolab \
  && fix-permissions "${CONDA_DIR}" \
  && fix-permissions "/home/${NB_USER}" \
  && mamba clean --all -y \
  && jupyter serverextension enable nbgitpuller --sys-prefix

COPY jupyter_notebook_config.json /home/${NB_USER}/.jupyter/

COPY .Rprofile /home/${NB_USER}/
