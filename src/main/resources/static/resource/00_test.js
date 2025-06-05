import * as THREE from 'three';
import { GLTFLoader } from 'GLTFLoader';
import { OrbitControls } from 'OrbitControls';

const container = document.getElementById('webgl-container');

// === Scene, Camera, Renderer ===
const scene = new THREE.Scene();
scene.background = new THREE.Color(0xdddddd);

const width = 900;
const height = 1260;

const camera = new THREE.PerspectiveCamera(75, width / height, 0.1, 1000);
camera.position.set(5, 5, 5);

const renderer = new THREE.WebGLRenderer({ antialias: true });
renderer.setSize(width, height);
container.appendChild(renderer.domElement);

// === Controls ===
const controls = new OrbitControls(camera, renderer.domElement);
controls.enableDamping = true;

// === Lighting ===
const directionalLight = new THREE.DirectionalLight(0xffffff, 2);
directionalLight.position.set(-1, 2, 4);
scene.add(directionalLight);

const ambientLight = new THREE.AmbientLight(0xffffff, 0.6);
scene.add(ambientLight);

// === GLTF Model Load ===
const loader = new GLTFLoader();
let model; // 모델을 클릭 이벤트에서 사용하기 위해 전역 변수로

loader.load('/models/Low_Part.glb', function (gltf) {
	model = gltf.scene;
	scene.add(model);

	model.position.set(0, 0, 0);

	model.traverse((child) => {
		if (child.isMesh) {
			child.userData.name = child.name;

			// 부위별 색상 지정
			if (child.name === 'Neck') {
				child.material = new THREE.MeshStandardMaterial({ color: 0xf8c471 }); // 주황
			} else if (child.name === 'Legs') {
				child.material = new THREE.MeshStandardMaterial({ color: 0x85c1e9 }); // 파랑
			} else if (child.name === 'Arms') {
				child.material = new THREE.MeshStandardMaterial({ color: 0xa9dfbf }); // 초록
			} else {
				child.material = new THREE.MeshStandardMaterial({ color: 0xffffff }); // 기본
			}
		}
	});
}, undefined, function (error) {
	console.error('모델 로딩 중 오류 발생:', error);
});

// === Raycaster ===
const raycaster = new THREE.Raycaster();
const mouse = new THREE.Vector2();

window.addEventListener('click', (event) => {
	mouse.x = (event.clientX / window.innerWidth) * 2 - 1;
	mouse.y = -(event.clientY / window.innerHeight) * 2 + 1;

	raycaster.setFromCamera(mouse, camera);

	if (model) {
		const intersects = raycaster.intersectObjects(model.children, true);

		if (intersects.length > 0) {
			const clickedPart = intersects[0].object;
			const partName = clickedPart.userData.name;
			console.log('Clicked:', partName);


			const showEl = document.getElementById('info-box');
			if (showEl) {
				showEl.style.display = 'block';
				showEl.classList.add('show');

				setTimeout(() => {
					showEl.style.display = 'none';
					showEl.classList.remove('show');
				}, 2000);
			}
		}
	}
});

// === 반응형 ===
window.addEventListener('resize', () => {
	camera.aspect = window.innerWidth / window.innerHeight;
	camera.updateProjectionMatrix();
	renderer.setSize(window.innerWidth, window.innerHeight);
});

// === 애니메이션 루프 ===
function animate() {
	requestAnimationFrame(animate);
	controls.update();
	renderer.render(scene, camera);
}
animate();
