##' Code preamble
##' =============
##' 
##' This code clears the session, just in case.
rm(list=ls())

##' Load the libraries used.
library(Hmisc)
library(graphics)

##' Data creation
##' =============
##' 
##' Create the data necessary for the figures in the NFS1484 exam.
##' 
##' ## Variables for figure 1: D6D ##
groups.levels <- c("Low", "Mid", "High")
RR.d6d <- c(1, 2.03, 2.55)
sd <- c(NA, 0.87, 1.12)
upper.d6d <- RR.d6d + sd
lower.d6d <- RR.d6d - sd
D6D.num <- 1:3

##' ## Variables for figure 1: CRP ##
groups.levels <- c("Low", "Mid", "High")
RR.crp <- c(1, 1.27, 1.69)
sd <- c(NA, 0.33, 0.54)
upper.crp <- RR.crp + sd
lower.crp <- RR.crp - sd
CRP.num <- 1:3

##' ## Variables for figure 2: Overall CRP ##
groups.interven <- c("Intervention", "Control")
overall.meanCRP <- c(2.01, 3.92)
sd <- c(0.31, 0.67)
overall.upperCRP <- overall.meanCRP + sd
overall.lowerCRP <- overall.meanCRP - sd

##' ## Variables for figure 2: Overall n6/n3 ##
groups.interven <- c("Intervention", "Control")
overall.mean.n6n3 <- c(5.55, 14.06)
sd <- c(3.10, 8.44)
overall.upper.n6n3 <- overall.mean.n6n3 + sd
overall.lower.n6n3 <- overall.mean.n6n3 - sd

##' ## Variables for figure 3: Gene CRP ##
group.genes <- c("LL", "LH", "", "HL", "HH")
genes.meanCRP <- c(1.97, 2.13, NA, 2.75, 3.56)
genes.sd.crp <- c(0.22, 0.54, NA, 0.63, 1.21)
genes.upperCRP <- genes.meanCRP + genes.sd.crp
genes.lowerCRP <- genes.meanCRP - genes.sd.crp
sign.values.CRP <- as.ordered(c("a", "a", "", "b", "c"))
sign.loc.CRP <- genes.upperCRP + 0.3

##' ## Variables for figure 3: Gene n6/n3 ##
group.genes <- c("LL", "LH", "", "HL", "HH")
genes.mean.n6n3 <- c(5.34, 5.25, NA, 10.25, 21.41)
sd <- c(0.92, 1.00, NA, 1.75, 3.12)
genes.upper.n6n3 <- genes.mean.n6n3 + sd
genes.lower.n6n3 <- genes.mean.n6n3 - sd
sign.values.n6n3 <- as.ordered(c("a", "a", "", "b", "c"))
sign.loc.n6n3 <- genes.upper.n6n3 + 2

##' Figure generation
##' =================
##' 
##' ## Study 1 --- Figure 1 ##
##' 
##' Generating figure for figure 1 of the final.
png(file = "../fig1.png", width = 550, height = 300)
#pdf(file = "../fig1.pdf", width = 10, height = 6)
par(mfrow = c(1, 2))
errbar(D6D.num, RR.d6d, upper.d6d, lower.d6d,
       ylab = "Relative risk (95% CI)",
       xlab = "D6D activity", ylim = c(0, 5),
       cex = 2, lwd = 2,
       xlim = c(0.75, 3.25),
       xaxt = "n", cap = 0.1)
axis(1, at = 1:3, labels = groups.levels)
abline(h = 1, lty = 2)

errbar(CRP.num, RR.crp, upper.crp, lower.crp,
       ylab = "Relative risk (95% CI)",
       xlab = "Serum CRP levels",
       ylim = c(0, 5), cex = 2, lwd = 2,
       xlim = c(0.75, 3.25),
       xaxt = "n", cap = 0.1)
axis(1, at = 1:3, labels = groups.levels)
abline(h = 1, lty = 2)
dev.off()

##' ## Study 2 --- Figure 2 ##
##' 
##' Generating figure 2 for the final.
png(file = "../fig2.png", width = 550, height = 300)
#pdf(file = "../fig2.pdf", width = 10, height = 6)
par(mfrow = c(1, 2))
bp <- barplot(height = overall.meanCRP, ylim = c(0, 5), col = "grey80",
              ylab = "Serum CRP (mg/L)", xlab = "Experimental group")
errbar(x = bp[, 1], y = overall.meanCRP,
       yplus = overall.upperCRP,
       yminus = overall.lowerCRP,
       add = T, xaxt = "n",
       cex = 1, lwd = 1,
       cap = 0.1)
axis(1, at = bp[, 1], labels = groups.interven)
text(x = bp[2, 1], y = overall.upperCRP[2] + 0.3, label = "*", cex = 2)

bp <- barplot(height = overall.mean.n6n3, ylim = c(0, 35), col = "grey80",
              ylab = "Serum ARA to EPA+DHA ratio", xlab = "Experimental group")
errbar(x = bp[, 1], y = overall.mean.n6n3,
       yplus = overall.upper.n6n3,
       yminus = overall.lower.n6n3,
       add = T, xaxt = "n",
       cex = 1, lwd = 1,
       cap = 0.10)
axis(1, at = bp[, 1], labels = groups.interven)
text(x = bp[2, 1], y = overall.upper.n6n3[2] + 2, label = "*", cex = 2)
dev.off()

##' ## Study 2 --- Figure 3 ##
##' 
##' Generating figure 3 for the final.
png(file = "../fig3.png", width = 550, height = 300)
#pdf(file = "../fig3.pdf", width = 10, height = 6)
par(mfrow = c(1, 2))
bp <- barplot(height = genes.meanCRP, ylim = c(0, 6), col = "grey80",
              ylab = "Serum CRP (mg/L)", xlab = "Experimental group")
errbar(x = bp[, 1], y = genes.meanCRP,
       yplus = genes.upperCRP,
       yminus = genes.lowerCRP,
       add = T, xaxt = "n",
       cex = 1, lwd = 1,
       cap = 0.05)
axis(1, at = bp[, 1], labels = group.genes)
text(x = bp[, 1], y = sign.loc.CRP, labels = sign.values.CRP, cex = 1)

bp <- barplot(height = genes.mean.n6n3, ylim = c(0, 30), col = "grey80",
              ylab = "Serum ARA to EPA+DHA ratio", xlab = "Experimental group")
errbar(x = bp[, 1], y = genes.mean.n6n3,
       yplus = genes.upper.n6n3,
       yminus = genes.lower.n6n3,
       add = T, xaxt = "n",
       cex = 1, lwd = 1,
       cap = 0.05)
axis(1, at = bp[, 1], labels = group.genes)
text(x = bp[, 1], y = sign.loc.n6n3, labels = sign.values.n6n3, cex = 1)
dev.off()

##' This code clears the session, just in case.
rm(list=ls())
