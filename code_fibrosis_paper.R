install.packages("devtools")
install.packages("SeuratObject")
install.packages("Seurat")
install.packages("Seurat")
install.packages("dplyr")
install.packages("dplyr")
install.packages("ggplot2")

suppressMessages(library(SeuratObject))
suppressMessages(library(dplyr))
suppressMessages(library(ggplot2))
suppressMessages(library(Seurat))

wagner2<- readRDS("~/Desktop/sequencing/wagner2/wagner_mnn_no_oocytes.rds")

##UMAPS figure.1B
DimPlot(object=wagner2,reduction = "umap")

DimPlot(object=wagner2,reduction = "umap",group.by="orig.ident")

#violin plots figure.1C

plot2 <- VlnPlot(
  object = wagner2,
  log = FALSE,
  features = c("FOXL2","AMH","KRT18","FST","CDH5","VWF","CLDN5","CD34","MYH11","MCAM","RGS5","RERGL","COL1A1","PDGFRA","DCN","NR2F2"),
  pt.size = 1,
  stack = TRUE
) + NoLegend()

plot2

#violin plots figure.1E

library(patchwork)

plots <- VlnPlot(wagner2, features = c("COL1A1","COL1A2"), split.by = "orig.ident", group.by = "seurat_clusters", 
                 pt.size = 0, combine = FALSE)
wrap_plots(plots = plots, ncol = 1)

plots <- VlnPlot(wagner2, features = c("COL3A1","COL6A1"), split.by = "orig.ident", group.by = "seurat_clusters", 
                 pt.size = 0, combine = FALSE)
wrap_plots(plots = plots, ncol = 1)

plots <- VlnPlot(wagner2, features = c("LUM","COL6A2"), split.by = "orig.ident", group.by = "seurat_clusters", 
                 pt.size = 0, combine = FALSE)
wrap_plots(plots = plots, ncol = 1)