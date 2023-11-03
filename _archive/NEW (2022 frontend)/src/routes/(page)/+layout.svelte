<script>
	import '../../app.css';
	import { onMount } from 'svelte';
	let Geometry;

	// import Header from '$lib/components/header/header.svelte';
	import Footer from '$lib/components/footer/footer.svelte';

	onMount(async () => {
		const module = await import('$lib/components/geometry/Geometry.svelte');
		Geometry = module.default;
	});
</script>

<svelte:head>
	<title>SILICON FM</title>
</svelte:head>

<!--svelte:component this={Geometry} /-->

<!--Header /-->
<Footer />
<slot />

<style>
</style>
