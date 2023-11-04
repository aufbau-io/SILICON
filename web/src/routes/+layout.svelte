<script>
	import './app.css';

	import { onMount } from 'svelte';
	import { screenType, isIframe } from '$lib/store/store';

	import Header from '$lib/components/header/header.svelte';
	// import Footer from '$lib/components/footer/footer.svelte';
	import LeftSidebar from '$lib/components/sidebars/left.svelte';
	import RightSidebar from '$lib/components/sidebars/right.svelte';

	$: showleftSidebar = $screenType == 3 && window.innerWidth > 1000 ? true : false;
	$: showRightSidebar = $screenType == 3 && window.innerWidth > 1000 ? true : false;

	let Geometry;

	onMount(async () => {
		const module = await import('$lib/graphics/three3d.svelte');
		Geometry = module.default;

		function getDeviceType() {
			const width =
				window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;

			if (
				'ontouchstart' in window ||
				navigator.maxTouchPoints > 0 ||
				navigator.msMaxTouchPoints > 0
			) {
				// This is a device which supports touch
				if (width <= 767) {
					// Mobile
					return 1;
				} else {
					// Tablet
					return 2;
				}
			} else {
				// This is likely a laptop or desktop
				return 3;
			}
		}

		screenType.set(getDeviceType());
		isIframe.set(window.location !== window.parent.location);
	});
</script>

<svelte:head>
	<title>SILICON | DANCE MUSIC SEARCH ENGINE</title>
	<meta name="description" content="SILICON FM DEMO. DANCE MUSIC SEARCH ENGINE." />

	<!-- <link
		rel="preload"
		href="/fonts/NB-Architekt-Pro-Light.woff"
		as="font"
		type="font/woff"
		crossorigin="anonymous"
	/>

	<link
		rel="preload"
		href="/fonts/NB-Architekt-Pro-Bold.woff"
		as="font"
		type="font/woff"
		crossorigin="anonymous"
	/> -->

	<!-- <link rel="preload" href="icons/cv.svg" as="image">
	<link rel="preload" href="icons/insta.svg" as="image">
	<link rel="preload" href="icons/mail.svg" as="image"> -->
</svelte:head>

<svelte:component this={Geometry} />

{#if $screenType}
	<main>



		{#if showleftSidebar}
		<div class="sidebar left">
			<LeftSidebar />
		</div>
		{/if}



		{#if showRightSidebar}
		<div class="sidebar right">
			<RightSidebar />
		</div>
		{/if}

		<header>
			<Header />
		</header>
		<!-- <body>
			<slot />
		</body> -->

		{#if $screenType == 1}
		<div class="title">
			<h1>silicon</h1>
		</div> 
		{/if}

		<!-- {#if $screenType == 3}
		<footer>
			<Footer />
		</footer>
		{/if} -->
		
	</main>
{/if}

<style>
	main {
		display: flex;
		flex-direction: column;
		height: 100dvh;
	}

	header {
		position: absolute;
		z-index: 1;
		top: 0;
		left: 400px;
		width: calc(100% - 400px);
	}

	footer {
		position: absolute;
		z-index: 1;
		bottom: 0;
		width: 100%;
	}

	.sidebar {
		position: absolute;
		z-index: 1;
		top: 0;
		height: 100%;
	}
	
	.sidebar.left {
		left: 0;
	}

	.sidebar.right {
		right: 0;
		top: 56px;
		height: calc(100% - 56px);
		overflow: hidden;
	}

	body {
		display: flex;
		flex-direction: column;
		/* padding: calc(1 * var(--margin)); */
		width: calc(100% - 800px);
		transform: translateX(240px);
	}

	@media only screen and (max-width: 1440px) {
    header {
      left: 0;
      width: 100%;

			/* TEMP EDIT */ 
			opacity:0;
      pointer-events: none;
      user-select: none;
    }

		.title {
			z-index: 10;
			height: 100%;
			width: 100%;
			display: flex;
			align-items: center;
			justify-content: center;

			pointer-events: none;
		user-select: none;
		}

		h1 {
		-webkit-text-stroke: .85px var(--primary);
		color: transparent;

		font-family: var(--font-header);
		font-size: 48px;
		letter-spacing: 2px;


	}
	}

</style>
