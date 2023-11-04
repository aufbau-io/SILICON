<script>
	import './app.css';

	import { onMount } from 'svelte';
	import { screenType, isIframe, showRightSidebar } from '$lib/store/store';

	import Header from '$lib/components/header/header.svelte';
	// import Footer from '$lib/components/footer/footer.svelte';
	import LeftSidebar from '$lib/components/sidebars/left.svelte';
	import RightSidebar from '$lib/components/sidebars/right.svelte';

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
	<title>SILICON</title>
	<meta name="description" content="DEMO DEMO DEMO" />

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



		<div class="sidebar left">
			<LeftSidebar />
		</div>



		{#if $showRightSidebar}
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
		left: 220px;
		width: calc(100% - 220px);
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

</style>
