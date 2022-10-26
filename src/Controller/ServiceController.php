<?php

namespace App\Controller;

use App\Entity\Service;
use App\Entity\Transactions;
use App\Entity\Usermoney;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;

class ServiceController extends AbstractController {
    public function removeService(ManagerRegistry $doctrine, Request $request, $id)
    {
        $entity = $doctrine->getManager();
        $service = $doctrine->getRepository(service::class)->find($id);
        $payment = $service->getCost() * $service->getValue();
        $days = cal_days_in_month(CAL_GREGORIAN, date("n"), date("Y"));
        $coster = $payment - $payment * (date("j")/$days);
        $balancer = $doctrine->getRepository(usermoney::class)->find(1);
        $balance = $balancer->getBalance();
        $entity = $doctrine->getManager();
        $transaction = new Transactions();
        $transaction->setService($service->getName());
        $transaction->setTransdate(date_create_from_format('Y-m-d', date("Y-m-d")));
        $transaction->setTransname("Отписка от услуги");
        $transaction->setCost(number_format($coster, 3, '.', ''));
        $transaction->setBalance(number_format($balance + $coster, 3, '.', ''));
        $balancer->setBalance(number_format($balance + $coster, 3, '.', ''));
        $entity->flush();
        $entity->persist($transaction);
        $entity->flush();
        $service->setActive(0);
        $service->setValue(1);
        $entity->flush();
        $repository = $doctrine->getRepository(service::class);
        $services = $repository->findAll();
        $repository = $doctrine->getRepository(usermoney::class);
        $budget = $repository->findAll();
        return $this->render('service.html.twig', [
            'services' => $services,
            'budget' => $budget,
            'warn' => '',
        ]);
    }

    public function addNewService(ManagerRegistry $doctrine, Request $request)
    {
        $warn = '';
        $id = $request->request->get('selects');
        $value = $request->request->get('val');
        $entity = $doctrine->getManager();
        $service = $doctrine->getRepository(service::class)->find($id);
        $payment = $service->getCost() * $value;
        $days = cal_days_in_month(CAL_GREGORIAN, date("n"), date("Y"));
        $coster = $payment - $payment * (date("j")/$days);
        $balancer = $doctrine->getRepository(usermoney::class)->find(1);
        $balance = $balancer->getBalance();
        $entity = $doctrine->getManager();
        if($balance - $coster >= 0) {
            $transaction = new Transactions();
            $transaction->setService($service->getName());
            $transaction->setTransdate(date_create_from_format('Y-m-d', date("Y-m-d")));
            $transaction->setTransname("Подписка на услугу");
            $transaction->setCost(number_format($coster * -1, 3, '.', ''));
            $transaction->setBalance(number_format($balance - $coster, 3, '.', ''));
            $balancer->setBalance(number_format($balance - $coster, 3, '.', ''));
            $entity->flush();
            $entity->persist($transaction);
            $entity->flush();
            $service->setActive(1);
            $service->setValue($value);
            $entity->flush();
        }
        else $warn = "Not enough money to subscribe!";
        $repository = $doctrine->getRepository(service::class);
        $services = $repository->findAll();
        $repository = $doctrine->getRepository(usermoney::class);
        $budget = $repository->findAll();
        return $this->render('service.html.twig', [
            'services' => $services,
            'budget' => $budget,
            'warn' => $warn,
        ]);
    }

}