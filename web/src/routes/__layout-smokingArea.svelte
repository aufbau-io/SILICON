<script>
	import '../app.css';
	import { onMount } from 'svelte';

	import Header from '$lib/components/header/header.svelte';
	import Footer from '$lib/components/footer/footer.svelte';
	import NavStrip from '$lib/components/common/navStrip.svelte';

	// important for accessibility
	if (import.meta.env.DEV) {
		onMount(() =>
			import('https://unpkg.com/agnostic-axe@3').then(({ AxeObserver, logViolations }) => {
				const MyAxeObserver = new AxeObserver(logViolations);
				MyAxeObserver.observe(document);
			})
		);
	}
</script>

<Header />
<main>
	<slot />
</main>
<Footer />

<style>
	main {
		margin: 40px;
	}
</style>
