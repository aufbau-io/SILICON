<script>
	import '../app.css';
</script>

<slot />
<div id="phoneBlock"><p class="sml">wip, use desktop</p></div>

<style>
	#phphoneBlock {
		opacity: 0;
		z-index: -100;
		width: 0;
		height: 0;
	}

	@media only screen and (max-width: 768px) {
		#phoneBlock {
			position: absolute;
			top: 0;
			left: 0;

			display: flex;
			align-items: center;
			justify-content: center;

			height: 100vh;
			width: 100vw;
			opacity: 1;
			background: var(--black);
			z-index: 1000;
		}
	}
</style>
