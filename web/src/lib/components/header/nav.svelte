<script>
	import { page } from '$app/stores';

	export let navItems = [];
	export async function load() {
		return {
			props: {
				navItems
			}
		};
	}
</script>

<nav>
	{#each navItems as navItem}
		<a href={navItem.href} class:active={$page.url.pathname === navItem.href}
			>[&nbsp;{navItem.name}&nbsp;]</a
		>
	{/each}
</nav>

<style>
	nav a {
		font-size: 15px;
		line-height: 110%;
		font-weight: 400;
		letter-spacing: 0.05em;
		padding: 10px;
	}

	.active {
		color: var(--green);
	}
</style>
