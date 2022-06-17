<script>
	import { onMount } from 'svelte';
	import * as THREE from 'three';

	let container;

	let camera, scene, renderer;

	let mouseX = 0,
		mouseY = 0;

	let windowHalfX = window.innerWidth / 2;
	let windowHalfY = window.innerHeight / 2;

	init();
	animate();

	function init() {
		camera = new THREE.PerspectiveCamera(20, window.innerWidth / window.innerHeight, 1, 10000);
		camera.position.z = 1800;

		scene = new THREE.Scene();
		scene.background = new THREE.Color(0x171717);

		const light = new THREE.DirectionalLight(0xf0f0f0);
		light.position.set(0, 1, 1);
		scene.add(light);

		// shadow

		const canvas = document.createElement('canvas');
		canvas.width = 128;
		canvas.height = 128;

		const context = canvas.getContext('2d');
		const gradient = context.createRadialGradient(
			canvas.width / 2,
			canvas.height / 2,
			0,
			canvas.width / 2,
			canvas.height / 2,
			canvas.width / 2
		);
		gradient.addColorStop(0.1, '#0a0a0a');
		gradient.addColorStop(1, '#171717');

		context.fillStyle = gradient;
		context.fillRect(0, 0, canvas.width, canvas.height);

		const shadowTexture = new THREE.CanvasTexture(canvas);

		const shadowMaterial = new THREE.MeshBasicMaterial({ map: shadowTexture });
		const shadowGeo = new THREE.PlaneGeometry(300, 300, 1, 1);

		let shadowMesh;

		shadowMesh = new THREE.Mesh(shadowGeo, shadowMaterial);
		shadowMesh.position.y = -250;
		shadowMesh.rotation.x = -Math.PI / 2;
		scene.add(shadowMesh);

		shadowMesh = new THREE.Mesh(shadowGeo, shadowMaterial);
		shadowMesh.position.y = -250;
		shadowMesh.position.x = -400;
		shadowMesh.rotation.x = -Math.PI / 2;
		scene.add(shadowMesh);

		shadowMesh = new THREE.Mesh(shadowGeo, shadowMaterial);
		shadowMesh.position.y = -250;
		shadowMesh.position.x = 400;
		shadowMesh.rotation.x = -Math.PI / 2;
		scene.add(shadowMesh);

		const radius = 200;

		const geometry1 = new THREE.IcosahedronGeometry(radius, 1);

		const count = geometry1.attributes.position.count;
		geometry1.setAttribute('color', new THREE.BufferAttribute(new Float32Array(count * 3), 3));

		const geometry2 = geometry1.clone();
		const geometry3 = geometry1.clone();

		const color = new THREE.Color();
		const positions1 = geometry1.attributes.position;
		const positions2 = geometry2.attributes.position;
		const positions3 = geometry3.attributes.position;
		const colors1 = geometry1.attributes.color;
		const colors2 = geometry2.attributes.color;
		const colors3 = geometry3.attributes.color;

		for (let i = 0; i < count; i++) {
			color.setRGB(1.5, (positions1.getY(i) / radius + 1) / 2, 1);
			colors1.setXYZ(i, color.r, color.b, color.b);

			color.setRGB(0.5, (positions2.getY(i) / radius + 1) / 2, 1);
			colors2.setXYZ(i, color.g, color.b, color.g);

			color.setRGB(1.5, 0.8 - (positions3.getY(i) / radius + 1) / 2, 0);
			colors3.setXYZ(i, color.r, color.g, color.b);
		}

		const material = new THREE.MeshPhongMaterial({
			color: 0xffffff,
			flatShading: true,
			vertexColors: true,
			shininess: 0
		});

		// let texture = new THREE.TextureLoader().load(map);
		// let material = new THREE.MeshBasicMaterial({ map: texture });

		const wireframeMaterial = new THREE.MeshBasicMaterial({
			color: 0x171717,
			wireframe: true,
			transparent: true
		});

		let mesh = new THREE.Mesh(geometry1, material);
		let wireframe = new THREE.Mesh(geometry1, wireframeMaterial);
		mesh.add(wireframe);
		mesh.position.x = -400;
		mesh.rotation.x = -1.87;
		scene.add(mesh);

		mesh = new THREE.Mesh(geometry2, material);
		wireframe = new THREE.Mesh(geometry2, wireframeMaterial);
		mesh.add(wireframe);
		mesh.position.x = 400;
		mesh.rotation.y = -0;
		scene.add(mesh);

		mesh = new THREE.Mesh(geometry3, material);
		wireframe = new THREE.Mesh(geometry3, wireframeMaterial);
		mesh.add(wireframe);
		mesh.rotation.y = +1.87;
		mesh.rotation.x = -0.87;
		scene.add(mesh);

		renderer = new THREE.WebGLRenderer({ antialias: false });
		renderer.setPixelRatio(window.devicePixelRatio);
		renderer.setSize(window.innerWidth, window.innerHeight);

		onMount(() => {
			container.appendChild(renderer.domElement);
		});

		document.addEventListener('mousemove', onDocumentMouseMove);

		//

		window.addEventListener('resize', onWindowResize);
	}

	function onWindowResize() {
		windowHalfX = window.innerWidth / 2;
		windowHalfY = window.innerHeight / 2;

		camera.aspect = window.innerWidth / window.innerHeight;
		camera.updateProjectionMatrix();

		renderer.setSize(window.innerWidth, window.innerHeight);
	}

	function onDocumentMouseMove(event) {
		mouseX = event.clientX - windowHalfX;
		mouseY = event.clientY - windowHalfY;
	}

	//

	function animate() {
		requestAnimationFrame(animate);
		render();
	}

	function render() {
		camera.position.x += (mouseX - camera.position.x) * 0.05;
		camera.position.y += (-mouseY - camera.position.y) * 0.05;

		camera.lookAt(scene.position);

		renderer.render(scene, camera);
	}
</script>

<div bind:this={container} class:geometry={true} />

<style>
	.geometry {
		position: absolute;
		top: 0;
		left: 0;
		overflow: hidden;
		z-index: -10;
		opacity: 0.8;
	}
</style>
