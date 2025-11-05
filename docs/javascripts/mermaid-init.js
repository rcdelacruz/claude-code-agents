// Initialize Mermaid diagrams
window.addEventListener('DOMContentLoaded', (event) => {
  mermaid.initialize({
    startOnLoad: true,
    theme: 'default',
    themeVariables: {
      primaryColor: '#4F46E5',
      primaryTextColor: '#1F2937',
      primaryBorderColor: '#6366F1',
      lineColor: '#4B5563',
      secondaryColor: '#3B82F6',
      tertiaryColor: '#E0E7FF',
      background: '#FFFFFF',
      mainBkg: '#F9FAFB',
      secondBkg: '#F3F4F6',
      border1: '#E5E7EB',
      border2: '#D1D5DB',
      note: '#FEF3C7',
      noteBorder: '#F59E0B',
      noteBkg: '#FFFBEB',
      noteText: '#78350F',
      textColor: '#1F2937',
      labelBackground: '#FFFFFF',
      clusterBkg: '#F9FAFB',
      clusterBorder: '#D1D5DB',
      defaultLinkColor: '#6366F1',
      titleColor: '#111827',
      edgeLabelBackground: '#FFFFFF',
      actorBorder: '#6366F1',
      actorBkg: '#E0E7FF',
      actorTextColor: '#1F2937',
      actorLineColor: '#6366F1',
      signalColor: '#1F2937',
      signalTextColor: '#1F2937',
      labelBoxBkgColor: '#E0E7FF',
      labelBoxBorderColor: '#6366F1',
      labelTextColor: '#1F2937',
      loopTextColor: '#1F2937',
      activationBorderColor: '#6366F1',
      activationBkgColor: '#E0E7FF',
      sequenceNumberColor: '#FFFFFF'
    },
    fontFamily: 'Work Sans, sans-serif',
    fontSize: 16,
    flowchart: {
      useMaxWidth: true,
      htmlLabels: true,
      curve: 'basis'
    },
    sequence: {
      useMaxWidth: true,
      mirrorActors: true
    },
    gantt: {
      useMaxWidth: true
    }
  });

  // Update Mermaid theme based on color scheme
  const observer = new MutationObserver((mutations) => {
    mutations.forEach((mutation) => {
      if (mutation.attributeName === 'data-md-color-scheme') {
        const scheme = document.body.getAttribute('data-md-color-scheme');
        const theme = scheme === 'slate' ? 'dark' : 'default';

        mermaid.initialize({
          theme: theme,
          startOnLoad: true
        });

        // Re-render all mermaid diagrams
        document.querySelectorAll('.mermaid').forEach((element) => {
          const id = element.getAttribute('data-processed');
          if (id) {
            element.removeAttribute('data-processed');
            element.innerHTML = element.getAttribute('data-mermaid-src');
          }
        });

        mermaid.init(undefined, '.mermaid');
      }
    });
  });

  observer.observe(document.body, {
    attributes: true,
    attributeFilter: ['data-md-color-scheme']
  });

  // Store original mermaid source for re-rendering
  document.querySelectorAll('.mermaid').forEach((element) => {
    element.setAttribute('data-mermaid-src', element.innerHTML);
  });

  // Add click-to-zoom functionality for Mermaid diagrams
  function addMermaidZoom() {
    document.querySelectorAll('.mermaid').forEach((diagram) => {
      // Add zoom cursor style
      diagram.style.cursor = 'zoom-in';
      diagram.style.transition = 'transform 0.3s ease';

      // Click handler for zoom
      diagram.addEventListener('click', function(e) {
        // Check if already zoomed
        if (this.classList.contains('mermaid-zoomed')) {
          // Zoom out
          this.classList.remove('mermaid-zoomed');
          this.style.position = '';
          this.style.top = '';
          this.style.left = '';
          this.style.width = '';
          this.style.height = '';
          this.style.zIndex = '';
          this.style.backgroundColor = '';
          this.style.cursor = 'zoom-in';
          this.style.transform = '';
          this.style.padding = '';
          this.style.boxShadow = '';
          document.body.style.overflow = '';
        } else {
          // Zoom in
          this.classList.add('mermaid-zoomed');
          this.style.position = 'fixed';
          this.style.top = '50%';
          this.style.left = '50%';
          this.style.width = '90vw';
          this.style.height = '90vh';
          this.style.zIndex = '9999';
          this.style.backgroundColor = 'var(--md-default-bg-color)';
          this.style.cursor = 'zoom-out';
          this.style.transform = 'translate(-50%, -50%)';
          this.style.padding = '20px';
          this.style.boxShadow = '0 0 0 9999px rgba(0,0,0,0.8)';
          document.body.style.overflow = 'hidden';
        }
        e.stopPropagation();
      });
    });
  }

  // Add zoom functionality after initial render
  setTimeout(addMermaidZoom, 500);

  // Re-add zoom after theme changes
  const originalInit = mermaid.init;
  mermaid.init = function(...args) {
    originalInit.apply(this, args);
    setTimeout(addMermaidZoom, 500);
  };
});
