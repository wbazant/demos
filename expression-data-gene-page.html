<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>expression-data-gene-page</title>
  <link rel="stylesheet" href="https://stackedit.io/style.css" />
</head>

<body class="stackedit">
  <div class="stackedit__html"><h3 id="current-state">Current state</h3>
<p>The expression data is on the study explorer page. We are linking the species page to the study explorer page.</p>
<h3 id="intent">Intent</h3>
<p>We will show a selected subset of the generated data for each gene of interest.</p>
<p>We will show a section at a time, among:</p>
<ul>
<li>Life stages</li>
<li>Organism parts</li>
<li>Variation within species</li>
<li>Cell types</li>
<li>Response to treatment</li>
<li>Other</li>
</ul>
<p>The first four sections will have the same, ‘baseline’, display format.</p>
<h3 id="location-on-the-gene-page">Location on the gene page</h3>
<p>This is the left hand side menu on the gene page that we wish to extend:</p>
<pre><code>Gene-based displays
   Summary
       Splice variants
       🆕  User Comments (0)
   Sequence
   Literature
   Comparative genomics
       Gene tree
       Orthologues
       Paralogues
   Gene Ontology
       Biological process
       Cellular component
       Molecular function
   Pathway
   External references
   ID History
       Gene history
   Expression
</code></pre>
<p>Change the “expression” part. As aside: remove “New” from User Comments and remove “Pathway”.</p>
<h3 id="left-hand-side-menu-content">Left hand side menu content</h3>
<p>The content should be determined during ‘packing’ the species, as an expandable menu, with the parent node saying ‘Expression’ in gray, and as its children the subset of above six categories for which there is data, in blue, as links to individual section.</p>
<p>As a common special case, ‘Expression -&gt; Other’ should appear as one-level non-expandable ‘Expression’.</p>
<h3 id="interface-description">Interface description</h3>
<p>Each page will have a section title (e.g. “Gene expression - life stages”) and one or more panes.</p>
<p>In the ‘baseline’ format, each pane will have a title:</p>
<p>Expression (TPM) - <a href="title">link to study page</a></p>
<p>Under a title, there should be a table with the data. Usually, this should be a “flat”, one row table listing the values in TPMs, and column headers listing the conditions.</p>
<p>Where possible to construct, in the case of multi-dimensional designs, this should be a two-dimensional table with both row and column headers, with column headers listing the largest dimension of the design, and row headers listing the remaining dimensions.</p>
<p>The ‘Other’ category should be like above, except the data in a one row table should be statistical aggregates, and column headers listing the statistics : n, low, Q1, Q2, Q3, high.</p>
<p>The ‘Response to treatment’ category should present results from each study where significant expression was found, with a title:</p>
<p>Differential expression (log2foldchange, where adjusted p-value &lt; 0.05) - <a href="title">link to study page</a></p>
<p>The values should be presented in a one column vertical table, with row headers being the comparison type + contrast name.</p>
<p>If there was no data for some studies, then under the results a separate pane should appear, titled “No significant results” and a bullet point style list of studies, of the format <a href="title">link to study page</a>.</p>
<h3 id="presentation-layer">Presentation layer</h3>
<p>The display code will create styled HTML from a plain Perl payload of the format:</p>
<pre><code>
{
section_title, # saying "Gene expression" and category
panes : [{
pane_title,
study_title,
study_id,
type = "table_flat_horizontal",
column_headers : [String],
values : [Number],
} | {
pane_title,
study_title,
study_id,
type = "table_rows_and_columns",
column_headers : [String],
row_headers : [String],
values: [[Number]],
} | {
pane_title,
study_title,
study_id,
type = "table_flat_vertical",
row_headers : [String],
values : [Number],
} | {
pane_title,
type = "list_of_studies",
values : [{
study_title,
study_id,
}]
}]
}
</code></pre>
<p>Studies should be linked to sections in the study explorer page, as URLs following pattern <code>/expression/$species/#$study_id</code>.</p>
<h3 id="architecture">Architecture</h3>
<p>We are confident that this functionality can be achieved without storing the data in a relational database, or introducing library depencencies to the web server code. The web server code will gain one Perl module tasked with retrieving the data, with a class capturing the desired behaviour.</p>
<p>An instance of that class should be created for each species. The construction parameters should be species name, assembly, and a data folder, location of which will be provided via config. Upon construction, the module will parse a listing of study id | category | title, and note the locations of all data files it will need access to. The instance should be cached in web server memory.</p>
<p>Then on request, the module should get the data it needs from each file using a <code>grep</code> on the file twice: once for the data values, once for the conditions from the data header. If the approach of table scanning the whole file will not be fast enough, we will try storing the data in binary files as B-trees, leveraging a BerkeleyDB type component already installed on the web servers. We anticipate that this may not be necessary - the files are of low quantity and modest size.</p>
</div>
</body>

</html>
