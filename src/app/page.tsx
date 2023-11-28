// ./app/page.tsx

import Auth from "./component/account/auth";

export default function Home() {
  return (
    <main className="flex flex-col items-center justify-between p-24">
      <div className="text-black">
        <h1 className="text-center text-6xl">Альтернативная Федерация</h1>
        <div className="flex flex-row items-center justify-between">
          <div>
            <div>
              <label>- Ноль уникальных рас, один мир, раскиданный по рандом</label>
            </div>
            <div>
              <label>- Отнимание застроенных планет, переработка при добычи астероидов, расколка артефактов</label>
            </div><div>
              <label>- Пацифизм, никаких бомбардировок и уничтожения планет, управление боем оффлайн, антипиратство и никакого шпионажа с диверсиями</label>
            </div><div>
              <label>- Шаблонные проекты кораблей, без вариантов комплектации</label>
            </div><div>
              <label>- Опущенная экономика и отсутствие дипломатии, ограниченные уровни исследований вашим кошельком</label>
            </div>
          </div>
          <Auth/>
        </div>
        
        
      </div>
    </main>
  );
}