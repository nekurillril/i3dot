const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#070707", /* black   */
  [1] = "#777777", /* red     */
  [2] = "#878787", /* green   */
  [3] = "#989898", /* yellow  */
  [4] = "#A8A8A8", /* blue    */
  [5] = "#B8B8B8", /* magenta */
  [6] = "#C8C8C8", /* cyan    */
  [7] = "#e2e2e2", /* white   */

  /* 8 bright colors */
  [8]  = "#9e9e9e",  /* black   */
  [9]  = "#777777",  /* red     */
  [10] = "#878787", /* green   */
  [11] = "#989898", /* yellow  */
  [12] = "#A8A8A8", /* blue    */
  [13] = "#B8B8B8", /* magenta */
  [14] = "#C8C8C8", /* cyan    */
  [15] = "#e2e2e2", /* white   */

  /* special colors */
  [256] = "#070707", /* background */
  [257] = "#e2e2e2", /* foreground */
  [258] = "#e2e2e2",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
