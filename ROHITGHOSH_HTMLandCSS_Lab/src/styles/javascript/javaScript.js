const bars = document.querySelectorAll('.bar');

bars.forEach(bar => {
    const height = bar.style.height;
    bar.style.height = '0%';
    bar.style.transitionDelay = Math.random() * 2 + 's';
    bar.style.transitionDuration = '2s';
    bar.style.height = height;
});
